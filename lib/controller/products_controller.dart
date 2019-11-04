import 'package:patm_first_api/patm_first_api.dart';
import 'package:patm_first_api/model/product.dart';

class ProductsController extends ResourceController {
  ProductsController(this.context);

  final ManagedContext context;

  @Operation.post()
  Future<Response> createProduct(@Bind.body() Product product) async {
    if(product.name == null || product.price == null || product.cost == null ||
        product.stock == null || product.reorder == null || product.commited == null ||
    product.image == null) {
      return Response.badRequest(
        body: {"error":"all fields required"}
      );
    }

    return Response.ok(await Query(context, values: product).insert());
  }

  @Operation.get()
  Future<Response> getAllProducts() async {
    return Response.ok(await Query<Product>(context).fetch());
  }

  @Operation.get('id')
  Future<Response> getProductById(@Bind.path('id') int id) async {
    final productQuery = Query<Product>(context)
        ..where((p) => p.id).equalTo(id);

    final product = await productQuery.fetchOne();

    if(product == null)
      return Response.notFound();
    
    return Response.ok(product);
  }
}