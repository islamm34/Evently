import 'package:e_commerce/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts({int page = 1, String? category, String? search});
  Future<Product> getProduct(String id);
  Future<List<String>> getCategories();
  Future<List<Product>> getFeaturedProducts();
}
