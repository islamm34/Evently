import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce/core/themes.dart';
import 'package:e_commerce/presentation/screens/auth/login_screen.dart';
import 'package:e_commerce/presentation/screens/auth/signup_screen.dart';
import 'package:e_commerce/presentation/screens/home/home_screen.dart';
import 'package:e_commerce/presentation/screens/product/product_details_screen.dart';
import 'package:e_commerce/presentation/screens/cart/cart_screen.dart';
import 'package:e_commerce/presentation/screens/profile/profile_screen.dart';
import 'package:e_commerce/core/di.dart';
import 'package:e_commerce/domain/entities/user.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) => ProductDetailsScreen(
        productId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return MaterialApp.router(
      title: 'SnapShop',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: _router,
      builder: (context, child) {
        return authState.when(
          data: (user) {
            if (user == null) {
              // Redirect to login if not authenticated
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _router.go('/login');
              });
            }
            return child ?? const SizedBox();
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        );
      },
    );
  }
}
