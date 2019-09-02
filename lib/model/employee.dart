import 'package:patm_first_api/patm_first_api.dart';
import 'package:patm_first_api/model/order.dart';
import 'package:patm_first_api/model/user.dart';

class Employee extends ManagedObject<_Employee> implements _Employee {}

class _Employee {
  @primaryKey
  int id;

  String firstame;

  String lastame;

  @Column(indexed: true)
  DateTime birthdate;

  @Column(unique: true)
  String email;

  ManagedSet<Order> employee;

  User user;
}