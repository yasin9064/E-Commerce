import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/screens/cart_screen.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/product_detail_screen.dart';
import 'package:myapp/screens/product_screen.dart';
import 'package:myapp/screens/profile_screen.dart';
import 'package:myapp/screens/wishlist_screen.dart';
import 'package:myapp/widgets/app_shell.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/products',
          builder: (context, state) => const ProductScreen(),
          routes: [
            GoRoute(
              path: 'detail',
              builder: (context, state) {
                final product = state.extra as Product;
                return ProductDetailScreen(product: product);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/cart',
          builder: (context, state) => const CartScreen(),
        ),
        GoRoute(
          path: '/wishlist',
          builder: (context, state) => const WishlistScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);
