import 'package:patm_first_api/controller/employees_controller.dart';
import 'package:patm_first_api/controller/products_controller.dart';
import 'package:patm_first_api/controller/register_controller.dart';
import 'package:patm_first_api/model/user.dart';
import 'package:aqueduct/managed_auth.dart';

import 'patm_first_api.dart';

class PatmFirstApiChannel extends ApplicationChannel {

  ManagedContext context;

  AuthServer authServer;

  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        "gerente", "gerente123", "kwikemart", 5432, "epp_db");

    context = ManagedContext(dataModel, persistentStore);

    final authStorage = ManagedAuthDelegate<User>(context);
    authServer = AuthServer(authStorage);
  }


  @override
  Controller get entryPoint {
    final router = Router();

    router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });

    router
        .route('/auth/token')
        .link(() => AuthController(authServer));

    router
    .route("/employees/[:id]")
    .link(() => EmployeesController(context));

    router
    .route("/products/[:id]")
    .link(() => ProductsController(context));

    router
    .route("/login")
    .link(() => RegisterController(context, authServer));
    
    router
    .route("/register")
    .link(() => RegisterController(context, authServer));

    return router;
  }
}