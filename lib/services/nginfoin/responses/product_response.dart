import 'package:movie21/services/nginfoin/models/product_model.dart';
import 'package:movie21/services/nginfoin/network_nginfoin.dart';

class ProductResponse {
  late final NetworkNginfoin networkService;

  ProductResponse(this.networkService);

  Future<List<Product>> getProduct({int? page, int? size}) async {
    final response4 = await networkService.get(
        url: "/api/product/list",
        queryParameters: {"page": page, "size": size});
    return List<Product>.from(
        (response4.data['data']['data'] ?? []).map((x) => Product.fromJson(x)));
  }
}
