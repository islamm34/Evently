import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce/core/di.dart';
import 'package:e_commerce/core/utils.dart';
import 'package:e_commerce/domain/entities/cart_item.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemsAsync = ref.watch(cartRepositoryProvider).getCartItems();

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: cartItemsAsync.when(
        data: (items) => items.isEmpty
            ? const Center(child: Text('Your cart is empty'))
            : _buildCartList(context, items),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildCartList(BuildContext context, List<CartItem> items) {
    final total = items.fold<double>(
      0,
      (sum, item) => sum + item.price * item.quantity,
    );

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                leading: item.image != null
                    ? Image.network(
                        item.image!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.image),
                title: Text(item.name),
                subtitle: Text(AppUtils.formatCurrency(item.price)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => ref
                          .read(cartRepositoryProvider)
                          .updateCartItem(item.productId, item.quantity - 1),
                    ),
                    Text('${item.quantity}'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => ref
                          .read(cartRepositoryProvider)
                          .updateCartItem(item.productId, item.quantity + 1),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Total: ${AppUtils.formatCurrency(total)}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigate to checkout
                  AppUtils.showSnackBar(
                    context,
                    'Checkout not implemented yet',
                  );
                },
                child: const Text('Checkout'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
