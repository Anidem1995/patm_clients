import 'package:aqueduct/managed_auth.dart';
import 'package:patm_first_api/model/employee.dart';
import 'package:patm_first_api/patm_first_api.dart';

class User extends ManagedObject<_User> implements _User, ManagedAuthResourceOwner<_User> {
  @Serialize(input: true, output: false)
  String password;
}

class _User extends ResourceOwnerTableDefinition {

  @Relate(#user)
  Employee employee;
}