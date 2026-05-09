import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/domain/entities/order.dart' hide Order;
import 'package:e_commerce/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Order>> getOrders() async {
    // Assume userId is current user
    const userId = 'current_user_id'; // Get from auth
    final snapshot = await _firestore.collection('orders')
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .get();
    return snapshot.docs.map((doc) => Order.fromJson(doc.data())).toList();
  }

  @override
  Future<Order> getOrder(String id) async {
    final doc = await _firestore.collection('orders').doc(id).get();
    return Order.fromJson(doc.data()!);
  }

  @override
  Future<Order> createOrder(List<OrderItem> items, String shippingAddress) async {
    const userId = 'current_user_id';
    final order = Order(
      id: '', // Will be set by Firestore
      userId: userId,
      items: items,
      total: items.fold(0, (sum, item) => sum + item.price * item.quantity),
      status: 'pending',
      createdAt: DateTime.now(),
      shippingAddress: shippingAddress,
    );

    final docRef = await _firestore.collection('orders').add(order.toJson());
    return order.copyWith(id: docRef.id);
  }

  @override
  Future<void> updateOrderStatus(String orderId, String status) async {
    await _firestore.collection('orders').doc(orderId).update({'status': status});
  }
}
