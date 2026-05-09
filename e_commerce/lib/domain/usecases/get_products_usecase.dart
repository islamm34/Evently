import 'package:e_commerce/domain/entities/product.dart';
import 'package:e_commerce/domain/repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository productRepository;

  GetProductsUseCase(this.productRepository);

  Future<List<Product>> call({int page = 1, String? category, String? search}) async {
    return await productRepository.getProducts(page: page, category: category, search: search);
  }
}
