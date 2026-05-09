import 'package:e_commerce/domain/entities/order.dart';

abstract class OrderRepository {
  Future<List<Order>> getOrders();
  Future<Order> getOrder(String id);
  Future<Order> createOrder(List<OrderItem> items, String shippingAddress);
  Future<void> updateOrderStatus(String orderId, String status);
}
