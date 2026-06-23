import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/role_selection/presentation/screens/role_selection_screen.dart';
import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/authentication/presentation/screens/register_screen.dart';
import '../../features/customer/presentation/screens/home/customer_home_screen.dart';
import '../../features/customer/presentation/screens/discover/discover_businesses_screen.dart';
import '../../features/customer/presentation/screens/business_details/business_details_screen.dart';
import '../../features/customer/presentation/screens/queue/join_queue_screen.dart';
import '../../features/customer/presentation/screens/queue/active_ticket_screen.dart';
import '../../features/customer/presentation/screens/queue/digital_ticket_screen.dart';
import '../../features/customer/presentation/screens/queue/queue_tracking_screen.dart';
import '../../features/customer/presentation/screens/notifications/notifications_screen.dart';
import '../../features/customer/presentation/screens/history/history_screen.dart';
import '../../features/customer/presentation/screens/favorites/favorites_screen.dart';
import '../../features/customer/presentation/screens/reviews/reviews_screen.dart';
import '../../features/customer/presentation/screens/profile/profile_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/role-selection',
  routes: [
    // Authentication Routes
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),

    // Role Selection Route
    GoRoute(
      path: '/role-selection',
      name: 'role-selection',
      builder: (context, state) => const RoleSelectionScreen(),
    ),

    // Customer Routes
    GoRoute(
      path: '/customer/home',
      name: 'customer-home',
      builder: (context, state) => const CustomerHomeScreen(),
    ),
    GoRoute(
      path: '/discover',
      name: 'discover',
      builder: (context, state) => const DiscoverBusinessesScreen(),
    ),
    GoRoute(
      path: '/business/:businessId',
      name: 'business-details',
      builder: (context, state) {
        final businessId = state.pathParameters['businessId']!;
        return BusinessDetailsScreen(businessId: businessId);
      },
    ),
    GoRoute(
      path: '/join-queue/:businessId',
      name: 'join-queue',
      builder: (context, state) {
        final businessId = state.pathParameters['businessId']!;
        return JoinQueueScreen(businessId: businessId);
      },
    ),
    GoRoute(
      path: '/active-ticket',
      name: 'active-ticket',
      builder: (context, state) => const ActiveTicketScreen(),
    ),
    GoRoute(
      path: '/digital-ticket',
      name: 'digital-ticket',
      builder: (context, state) => const DigitalTicketScreen(),
    ),
    GoRoute(
      path: '/queue-tracking',
      name: 'queue-tracking',
      builder: (context, state) => const QueueTrackingScreen(),
    ),
    GoRoute(
      path: '/notifications',
      name: 'notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: '/history',
      name: 'history',
      builder: (context, state) => const HistoryScreen(),
    ),
    GoRoute(
      path: '/favorites',
      name: 'favorites',
      builder: (context, state) => const FavoritesScreen(),
    ),
    GoRoute(
      path: '/reviews',
      name: 'reviews',
      builder: (context, state) => const ReviewsScreen(),
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
