import 'package:patm_first_api/model/client_area.dart';
import 'package:patm_first_api/model/order.dart';
import 'package:patm_first_api/patm_first_api.dart';

class Client extends ManagedObject<_Client> implements _Client{}

class _Client {
  @primaryKey
  int id;

  String name;

  String address;

  @Column(unique: true)
  String email;

  @Column(unique: true)
  String phone;

  ManagedSet<Order> order;
  ManagedSet<ClientArea> clientarea;
}