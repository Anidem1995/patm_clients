import 'package:patm_first_api/patm_first_api.dart';
import 'package:patm_first_api/model/employee.dart';

class EmployeesController extends ResourceController {
  EmployeesController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllEmployees() async {
    final employeeQuery = Query<Employee>(context);
    final employees = await employeeQuery.fetch();

    return Response.ok(employees);
  }

  @Operation.post()
  Future<Response> createEmployee() async {
    final Map<String, dynamic> body = await request.body.decode();
    final query = Query<Employee>(context)
    ..values.firstame = body['firstname'] as String
    ..values.lastame = body['lastname'] as String
    ..values.birthdate = body['birthdate'] as DateTime
    ..values.email = body['email'] as String;
  }
}