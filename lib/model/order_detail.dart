import 'package:patm_first_api/model/order.dart';
import 'package:patm_first_api/model/product.dart';
import 'package:patm_first_api/patm_first_api.dart';

class OrderDetail extends ManagedObject<_OrderDetail> implements _OrderDetail {}

class _OrderDetail {
  @primaryKey
  int id;

  @Relate(#detail)
  Product product;

  @Relate(#detail)
  Order order;

  double price;
  double discount;
  double quantity;
}