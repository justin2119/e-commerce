import 'package:e_commerce/domain/models/product.dart';
import 'package:e_commerce/ui/feedback_screen.dart';
import 'package:e_commerce/ui/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../ui/home.dart';
import '../../ui/main_view.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainView(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const ProductScreen(),
                routes: [
                  GoRoute(
                    path: 'details',
                    builder: (context, state) {
                      final product = state.extra as Product;
                      return ProductDetailScreen(product: product);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/products',
                builder: (context, state) => const Center(child: Text("Liste des produits")),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/feedback',
                    builder: (context, state) => const FeedbackScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
