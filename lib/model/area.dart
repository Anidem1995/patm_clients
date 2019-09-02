import 'package:patm_first_api/model/client_area.dart';
import 'package:patm_first_api/patm_first_api.dart';

class Area extends ManagedObject<_Area> implements _Area{}

class _Area {
  @primaryKey
  int id;

  @Column(unique: true)
  String name;

  ManagedSet<ClientArea> clientarea;
}