import 'package:demo/backend/model/employee.dart';
import 'package:flutter/material.dart';

class DisplayInfo extends StatelessWidget {
  const DisplayInfo({Key? key, required this.employeeInfo}) : super(key: key);

  final EmployeeInfo employeeInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(employeeInfo.empId.toString()),
            Text(employeeInfo.empName.toString()),
            Text(employeeInfo.dateOfBirth.toString()),
            Text(employeeInfo.dateOfJoining.toString()),
            Text(employeeInfo.department.toString()),
          ],
        ),
      ),
    );
  }
}
