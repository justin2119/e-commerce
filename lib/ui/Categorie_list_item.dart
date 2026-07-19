import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../domain/wiewmodel/provider/Product_Notifier.dart';
class CategorieListItem extends ConsumerWidget {
  final String categorie;
  const CategorieListItem({super.key, required this.categorie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productCategorie = ref.watch(productNotifierProvider);
    return productCategorie.when(
      data: (products) {
        final filtered = products.where((p) => p.category == categorie).toList();
        return Scaffold(
          appBar: AppBar(
            title: Text(categorie),
          ),
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75
            ),
            itemBuilder: (context, index){
              final product = filtered[index];
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
                            icon: const Icon(Icons.favorite_border, color: Colors.deepOrange),
                            onPressed: () {},
                          )
                      ),
                    ]
                ),
              );

            },
            itemCount: filtered.length,
          )
        );
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(
        body: Center(child: Text('Error: $e')),
      ),
    );
    }
}
