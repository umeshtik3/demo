import 'package:demo/backend/api/api_manager.dart';
import 'package:demo/backend/model/employee.dart';
import 'package:demo/widgets/display_info.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _apiManager = ApiManager();
  List<EmployeeInfo>? _employeeInfoList;
  String? selectedDepartment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //sorting funtion
          },
          child: const Icon(Icons.filter_list_alt),
        ),
        appBar: AppBar(
          title: const Text('Employee Info'),
        ),
        body: FutureBuilder<List<EmployeeInfo>?>(
            future: _apiManager.fetchData(),
            builder: ((context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    return const ErrorWidget();
                  } else if (snapshot.hasData) {
                    _employeeInfoList = snapshot.data;

                    return buildEmployeeListView();
                  } else {
                    return const ErrorWidget();
                  }
              }
            })));
  }

  ListView buildEmployeeListView() {
    return ListView.builder(
      itemCount: _employeeInfoList?.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (() {
            _launchNextScreen(context, index);
          }),
          child: Card(
            child: ListTile(
              trailing: Text(
                  'Department : ${_employeeInfoList![index].department.toString()}'),
              title: Text('Name : ${_employeeInfoList![index].empName.toString()}'),
              subtitle: Text('Id :${_employeeInfoList![index].empId.toString()}'),
            ),
          ),
        );
      },
    );
  }

  void _launchNextScreen(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DisplayInfo(employeeInfo: _employeeInfoList![index])));
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Unable to fetch the data',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
