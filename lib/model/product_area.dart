import 'package:patm_first_api/model/client_area.dart';
import 'package:patm_first_api/model/product.dart';
import 'package:patm_first_api/patm_first_api.dart';

class ProductArea extends ManagedObject<_ProductArea> implements _ProductArea {}

class _ProductArea {
  @primaryKey
  int id;

  int uptake;

  @Relate(#productarea)
  ClientArea clientarea;

  @Relate(#productarea)
  Product product;
}