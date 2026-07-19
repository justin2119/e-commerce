import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../domain/wiewmodel/provider/Favorite_Notifier.dart';
import '../domain/wiewmodel/provider/Product_Notifier.dart';

class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Recherche un produit......",
            hintStyle: GoogleFonts.abel(),
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(5),
            child: Stack(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
                const Positioned(
                  right: 0,
                  child: Text("12", style: TextStyle(fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.deepOrange.shade50
        ),
        child: Column(
          children: [
            Expanded(
              child: productAsync.when(
                data: (products){
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.75
                    ),
                    itemBuilder: (context, index){
                      final product = products[index];
                      final isFavorite = ref.watch(favoriteProvider).any((item) => item.id == product.id);
                      return InkWell(
                        onTap: (){
                          context.push(
                              "/detail",
                              extra: product
                          );
                        },
                        child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey.shade200),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade100,
                                      blurRadius: 5,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                                        child: Image.network(
                                          product.imageUrl,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          errorBuilder: (context, error, stackTrace) =>
                                              Container(color: Colors.grey.shade200, child: const Icon(Icons.error)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.name,
                                            style: GoogleFonts.abel(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "${product.price} CFA",
                                            style: GoogleFonts.abel(
                                              fontSize: 16,
                                              color: Colors.deepOrange,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  top: 5,
                                  right: 5,
                                  child: IconButton(
                                    icon:Icon(Icons.favorite, color: isFavorite ? Colors.red : Colors.grey),
                                    onPressed: () {
                                      ref.read(favoriteProvider.notifier).toggleFavorite(product);
                                    },
                                  )
                              ),
                            ]
                        ),
                      );

                    },
                    itemCount: products.length,
                  );
                },
                error: (error, stackTrace) => Text("Erreur : $error"),
                loading: () => const Center(child: CircularProgressIndicator(
                  color: Colors.deepOrange,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
