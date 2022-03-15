import 'package:demo/backend/model/employee.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static var client = http.Client();
  final url = Uri.parse('https://dev.geekyworks.com/exercises/employee.json');
  Future<List<EmployeeInfo>?> fetchData() async {
    http.Response response = await client.get(url);
    Employee employee = Employee();
    List<EmployeeInfo>? employeeInfo;
    try {
      if (response.statusCode == 200) {
        String jsonString = response.body;
        employee = employeeFromJson(jsonString);
        if (employee.status == "success") {
          employeeInfo = employee.employeeInfo;
        }
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
    return employeeInfo;
  }
}
