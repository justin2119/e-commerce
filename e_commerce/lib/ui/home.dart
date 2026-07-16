import 'package:e_commerce/ui/widgets/category_chip.dart';
import 'package:e_commerce/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce/domain/wiewmodel/provider/Product_Notifier.dart';
import 'package:e_commerce/domain/wiewmodel/provider/filter_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productNotifierProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: TextField(
              onChanged: (value) => ref.read(searchQueryProvider.notifier).state = value,
              decoration: InputDecoration(
                hintText: "Rechercher un produit...",
                hintStyle: GoogleFonts.abel(),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
                height: 50,
                child: productAsync.when(
                  data: (products) {
                    final categories = products.map((p) => p.category).toSet().toList();
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: categories.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return CategoryChip(
                            label: "Tous",
                            isSelected: selectedCategory == null,
                            onSelected: () => ref.read(selectedCategoryProvider.notifier).state = null,
                          );
                        }
                        final category = categories[index - 1];
                        return CategoryChip(
                          label: category,
                          isSelected: selectedCategory == category,
                          onSelected: () => ref.read(selectedCategoryProvider.notifier).state = category,
                        );
                      },
                    );
                  },
                  loading: () => const SizedBox(),
                  error: (_, __) => const SizedBox(),
                ),
              ),
            ),
          ),
          productAsync.when(
            data: (products) {
              final filteredProducts = products.where((p) {
                final matchesSearch = p.name.toLowerCase().contains(searchQuery.toLowerCase());
                final matchesCategory = selectedCategory == null || p.category == selectedCategory;
                return matchesSearch && matchesCategory;
              }).toList();

              if (filteredProducts.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(child: Text("Aucun produit trouvé")),
                );
              }

              return SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final product = filteredProducts[index];
                      return ProductCard(
                        product: product,
                        onTap: () => context.go('/details', extra: product),
                      );
                    },
                    childCount: filteredProducts.length,
                  ),
                ),
              );
            },
            loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (err, stack) => SliverFillRemaining(
              child: Center(child: Text('Erreur: $err')),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.all(5),
                        height:MediaQuery.of(context).size.height*0.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepOrange,
                        )
                    ),
                    Positioned(
                      top: -20,
                      right: -50,
                        child:Image.asset(
                          "assets/image/01.png",
                          width:300,
                          height:400,
                        )
                    ),
                    Positioned(
                      top: 12,
                      left: 10,
                      child: Row(
                        children: [
                          Icon(Icons.shopify_sharp,color: Colors.white,size: 40,),
                          Text("E-commerce",style:GoogleFonts.abel(
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
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(10),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              )
                          ),
                          child: Text("Achetez maintenant",style: GoogleFonts.abel(
                              fontSize: 25,
                              color: Colors.deepOrange
                          ),)
                      ),
                    ),
                  ]
              ),
              SizedBox(height: 10,),
              Row(
                spacing: 5,
                children: [
                  Icon(Icons.api,color: Colors.deepOrange,),
                  Text("Catégorie",style: GoogleFonts.abel(
                      fontSize: 25,
                      color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
              SizedBox(height: 10,),
              Categorie(),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 5,
                children: [
                  Row(
                    children: [
                      Icon(Icons.api,color: Colors.deepOrange,),
                      Text("Recommandée",style: GoogleFonts.abel(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  TextButton(onPressed: (){}, child: Text("Voir plus",style: GoogleFonts.abel(
                    fontSize: 20,
                    color: Colors.deepOrange
                  )))
                ],
              ),
              SizedBox(height: 10,),
              RecommendeWidget()
            ]),
      )
    );
  }
}
