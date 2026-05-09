import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce/domain/repositories/cart_repository.dart';
import 'package:e_commerce/domain/entities/cart_item.dart';

class CartRepositoryImpl implements CartRepository {
  static const String _cartKey = 'cart_items';

  @override
  Future<List<CartItem>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getString(_cartKey);
    if (cartJson == null) return [];

    final List<dynamic> cartList = json.decode(cartJson);
    return cartList
        .map(
          (item) => CartItem(
            productId: item['productId'],
            name: item['name'],
            price: item['price'],
            quantity: item['quantity'],
            image: item['image'],
          ),
        )
        .toList();
  }

  @override
  Future<void> addToCart(String productId, int quantity) async {
    final items = await getCartItems();
    final existingIndex = items.indexWhere(
      (item) => item.productId == productId,
    );

    if (existingIndex != -1) {
      items[existingIndex] = CartItem(
        productId: items[existingIndex].productId,
        name: items[existingIndex].name,
        price: items[existingIndex].price,
        quantity: items[existingIndex].quantity + quantity,
        image: items[existingIndex].image,
      );
    } else {
      // Need to fetch product details, but for simplicity, assume passed
      // In real app, fetch from product repo
      throw UnimplementedError('Need product details');
    }

    await _saveCartItems(items);
  }

  @override
  Future<void> updateCartItem(String productId, int quantity) async {
    final items = await getCartItems();
    final index = items.indexWhere((item) => item.productId == productId);
    if (index != -1) {
      if (quantity <= 0) {
        items.removeAt(index);
      } else {
        items[index] = CartItem(
          productId: items[index].productId,
          name: items[index].name,
          price: items[index].price,
          quantity: quantity,
          image: items[index].image,
        );
      }
      await _saveCartItems(items);
    }
  }

  @override
  Future<void> removeFromCart(String productId) async {
    final items = await getCartItems();
    items.removeWhere((item) => item.productId == productId);
    await _saveCartItems(items);
  }

  @override
  Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }

  @override
  Future<int> getCartItemCount() async {
    final items = await getCartItems();
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  Future<void> _saveCartItems(List<CartItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = json.encode(
      items
          .map(
            (item) => {
              'productId': item.productId,
              'name': item.name,
              'price': item.price,
              'quantity': item.quantity,
              'image': item.image,
            },
          )
          .toList(),
    );
    await prefs.setString(_cartKey, cartJson);
  }
}
