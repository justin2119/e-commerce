import 'package:go_router/go_router.dart';

import '../ui/home.dart';
import '../ui/navigation_bottom.dart';
import '../ui/product_detail.dart';

final GoRouter appRouter=GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => NavigationBottom(),
    ),
    GoRoute(
        path: "/detail",
      builder: (context, state) => ProductDetail(),
    )
  ]
);