import 'package:patm_first_api/model/order_detail.dart';
import 'package:patm_first_api/model/product_area.dart';
import 'package:patm_first_api/patm_first_api.dart';

class Product extends ManagedObject<_Product> implements _Product {}

class _Product {
  @primaryKey
  int id;

  @Column(unique: true)
  String name;

  double cost;

  double price;

  int stock;

  int reorder;

  int commited;

  bool active;

  String image;

  ManagedSet<OrderDetail> detail;
  ManagedSet<ProductArea> productarea;
}