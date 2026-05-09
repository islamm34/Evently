import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce/data/repositories/auth_repository_impl.dart';
import 'package:e_commerce/data/repositories/product_repository_impl.dart';
import 'package:e_commerce/data/repositories/cart_repository_impl.dart';
import 'package:e_commerce/data/repositories/order_repository_impl.dart';
import 'package:e_commerce/domain/repositories/auth_repository.dart';
import 'package:e_commerce/domain/repositories/product_repository.dart';
import 'package:e_commerce/domain/repositories/cart_repository.dart';
import 'package:e_commerce/domain/repositories/order_repository.dart';
import 'package:e_commerce/domain/usecases/sign_in_usecase.dart';
import 'package:e_commerce/domain/usecases/sign_up_usecase.dart';
import 'package:e_commerce/domain/usecases/get_products_usecase.dart';
import 'package:e_commerce/domain/entities/user.dart';

// Repositories
final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepositoryImpl());
final productRepositoryProvider = Provider<ProductRepository>((ref) => ProductRepositoryImpl());
final cartRepositoryProvider = Provider<CartRepository>((ref) => CartRepositoryImpl());
final orderRepositoryProvider = Provider<OrderRepository>((ref) => OrderRepositoryImpl());

// Use Cases
final signInUseCaseProvider = Provider<SignInUseCase>((ref) => SignInUseCase(ref.watch(authRepositoryProvider)));
final signUpUseCaseProvider = Provider<SignUpUseCase>((ref) => SignUpUseCase(ref.watch(authRepositoryProvider)));
final getProductsUseCaseProvider = Provider<GetProductsUseCase>((ref) => GetProductsUseCase(ref.watch(productRepositoryProvider)));

// State Notifiers
final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
});
