import 'package:patm_first_api/model/area.dart';
import 'package:patm_first_api/patm_first_api.dart';

class AreasController extends ResourceController {
  AreasController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllEmployees() async {
    final areaQuery = Query<Area>(context);
    final areas = await areaQuery.fetch();

    return Response.ok(areas);
  }
}