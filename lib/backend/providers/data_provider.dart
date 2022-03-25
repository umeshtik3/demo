import 'package:demo/backend/api/api_manager.dart';
import 'package:demo/backend/model/employee.dart';
import 'package:flutter/cupertino.dart';

class DataProvider with ChangeNotifier {
  List<EmployeeInfo>? employeeInfoList;

  final _apiManager = ApiManager();

  Future<List<EmployeeInfo>?> getEmployeeData() async {
    employeeInfoList = await _apiManager.fetchData();
    return employeeInfoList;
  }

  List<EmployeeInfo>? sortedList(String? sortedOn) {
    if (sortedOn != null) {
      switch (sortedOn) {
        case 'Operations':
          {
            return employeeInfoList
                ?.where(
                    (element) => element.department == Departments.operations)
                .toList();
          }

        case 'HR':
          {
            return employeeInfoList
                ?.where((element) => element.department == Departments.hr)
                .toList();
          }

        case 'Finance':
          {
            return employeeInfoList
                ?.where((element) => element.department == Departments.finance)
                .toList();
          }
        case 'Purchase':
          {
            return employeeInfoList
                ?.where((element) => element.department == Departments.purchase)
                .toList();
          }
        case 'Marketing':
          {
            return employeeInfoList
                ?.where(
                    (element) => element.department == Departments.marketing)
                .toList();
          }
        default:
      }
    }
    return employeeInfoList;
  }
}
