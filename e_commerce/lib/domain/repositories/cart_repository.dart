import 'package:e_commerce/domain/entities/cart_item.dart';

abstract class CartRepository {
  Future<List<CartItem>> getCartItems();
  Future<void> addToCart(String productId, int quantity);
  Future<void> updateCartItem(String productId, int quantity);
  Future<void> removeFromCart(String productId);
  Future<void> clearCart();
  Future<int> getCartItemCount();
}
