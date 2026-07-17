import 'package:e_commerce/ui/widgets/recommende_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce/utils/product_provider.dart';
import 'package:e_commerce/utils/category_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import '../domain/wiewmodel/provider/Product_Notifier.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productNotifierProvider);
    final categoriesAsync = ref.watch(categoriesProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Rechercher un produit......",
            hintStyle: GoogleFonts.abel(),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(Icons.camera_alt),
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
        margin: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              Stack(
                  children: [
                    Container(
                        margin: const EdgeInsets.all(5),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepOrange,
                        )
                    ),
                    Positioned(
                      right: -55,
                        bottom: -20,
                        child: Image.asset(
                            "assets/image/01.png",
                          width: 300,
                          height: 300,
                          errorBuilder: (context, error, stackTrace) => const SizedBox(),
                        )
                    ),
                    Positioned(
                      top: 12,
                      left: 10,
                      child: Row(
                        children: [
                          const Icon(Icons.shopify_sharp, color: Colors.white, size: 40,),
                          Text("E-commerce", style: GoogleFonts.abel(
                              fontSize: 20,
                              color: Colors.white
                          ),)
                        ],
                      ),
                    ),
                    Positioned(
                        top: 60,
                        left: 15,
                        child:  Text(
                          "Découvrez \nl'expérience\nd'achat idéale !",
                          style: GoogleFonts.abel(
                              fontSize: 35,
                              color: Colors.white
                          ),
                        )
                    ),
                    Positioned(
                      bottom: 15,
                      left: 15,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              )
                          ),
                          child: Text("Achetez maintenant", style: GoogleFonts.abel(
                              fontSize: 25,
                              color: Colors.deepOrange
                          ),)
                      ),
                    ),
                  ]
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Icon(Icons.api, color: Colors.deepOrange,),
                  const SizedBox(width: 5),
                  Text("Catégories", style: GoogleFonts.abel(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
              const SizedBox(height: 10,),
              // Categories horizontal list
              SizedBox(
                height: 50,
                child: categoriesAsync.when(
                  data: (categories) => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ActionChip(
                          label: Text(cat, style: GoogleFonts.abel(color: Colors.white)),
                          backgroundColor: Colors.deepOrange,
                          onPressed: () => context.push('/category/$cat'),
                        ),
                      );
                    },
                  ),
                  loading: () => const Center(child: CircularProgressIndicator(color: Colors.deepOrange)),
                  error: (err, stack) => Text("Erreur: $err"),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.api, color: Colors.deepOrange,),
                      const SizedBox(width: 5),
                      Text("Recommandée", style: GoogleFonts.abel(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  TextButton(onPressed: () {
                    context.push("/liste");
                  }, child: Text("Voir plus", style: GoogleFonts.abel(
                    fontSize: 20,
                    color: Colors.deepOrange
                  )))
                ],
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: productAsync.when(
                  data: (products) => RecommendeWidget(products: products),
                  loading: () => const Center(child: CircularProgressIndicator(color: Colors.deepOrange)),
                  error: (error, stack) => Center(child: Text("Erreur : $error", style: GoogleFonts.abel())),
                ),
              ),
            ]),
      )
    );
  }
}
