import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/domain/entities/product.dart';
import 'package:e_commerce/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Product>> getProducts({int page = 1, String? category, String? search}) async {
    Query query = _firestore.collection('products');

    if (category != null) {
      query = query.where('category', isEqualTo: category);
    }

    if (search != null) {
      query = query.where('name', isGreaterThanOrEqualTo: search)
                   .where('name', isLessThan: search + 'z');
    }

    query = query.limit(20).orderBy('name');

    final snapshot = await query.get();
    return snapshot.docs.map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  @override
  Future<Product> getProduct(String id) async {
    final doc = await _firestore.collection('products').doc(id).get();
    return Product.fromJson(doc.data()!);
  }

  @override
  Future<List<String>> getCategories() async {
    final snapshot = await _firestore.collection('categories').get();
    return snapshot.docs.map((doc) => doc['name'] as String).toList();
  }

  @override
  Future<List<Product>> getFeaturedProducts() async {
    final snapshot = await _firestore.collection('products')
        .where('featured', isEqualTo: true)
        .limit(10)
        .get();
    return snapshot.docs.map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }
}
