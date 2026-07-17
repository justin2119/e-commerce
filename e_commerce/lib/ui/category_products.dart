import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/category_products_provider.dart';
import 'widgets/recommende_widget.dart';

class CategoryDetailScreen extends ConsumerWidget {
  final String categoryName;
  const CategoryDetailScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(categoryProductsProvider(categoryName));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName.toUpperCase(),
          style: GoogleFonts.abel(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: productsAsync.when(
          data: (products) => Column(
            children: [
              RecommendeWidget(products: products),
            ],
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(color: Colors.deepOrange),
          ),
          error: (err, stack) => Center(
            child: Text("Erreur: $err", style: GoogleFonts.abel()),
          ),
        ),
      ),
    );
  }
}
