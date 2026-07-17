import 'package:go_router/go_router.dart';
import '../domain/models/product.dart';
import '../ui/category_products.dart';
import '../ui/navigation_bottom.dart';
import '../ui/product_detail.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => NavigationBottom(),
    ),
    GoRoute(
      path: "/detail",
      builder: (context, state) {
        final product = state.extra as Product;
        return ProductDetail(product: product);
      },
    ),
    GoRoute(
      path: "/category/:categoryName",
      builder: (context, state) {
        final categoryName = state.pathParameters['categoryName']!;
        return CategoryDetailScreen(categoryName: categoryName);
      },
    ),
  ],
);
