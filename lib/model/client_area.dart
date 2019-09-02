import 'package:patm_first_api/model/area.dart';
import 'package:patm_first_api/model/client.dart';
import 'package:patm_first_api/model/product_area.dart';
import 'package:patm_first_api/patm_first_api.dart';

class ClientArea extends ManagedObject<_ClientArea> implements _ClientArea {}

class _ClientArea {
  @primaryKey
  int id;

  int employees;

  @Relate(#clientarea)
  Area area;

  @Relate(#clientarea)
  Client client;

  ManagedSet<ProductArea> productarea;
}