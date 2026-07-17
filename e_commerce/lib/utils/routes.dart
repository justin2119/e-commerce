import 'package:go_router/go_router.dart';
import '../domain/models/product.dart';
import '../ui/Categorie_list_item.dart';
import '../ui/navigation_bottom.dart';
import '../ui/product_detail.dart';
import '../ui/products_list.dart';

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
      path: "/categorie",
      builder: (context, state) {
        final categorie=state.extra as String;
        return CategorieListItem(categorie: categorie,);
      },
    ),
    GoRoute(
      path: "/categorie",
      builder: (context, state){
        final categorie= state.extra as String;
        return CategorieListItem(categorie: categorie,);
      },
    ),
    GoRoute(
      path: "/liste",
      builder: (context, state) => ProductList(),
    ),
  ]
);
