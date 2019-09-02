import 'package:patm_first_api/model/employee.dart';
import 'package:patm_first_api/model/order_detail.dart';
import 'package:patm_first_api/patm_first_api.dart';
import 'package:patm_first_api/model/client.dart';

class Order extends ManagedObject<_Order> implements _Order{}

class _Order {
  @primaryKey
  int id;

  @Column(indexed: true)
  DateTime orderDate;

  @Column(indexed: true)
  DateTime sentDate;

  @Relate(#order)
  Client clientId;

  @Relate(#employee)
  Employee employee;

  ManagedSet<OrderDetail> detail;
}