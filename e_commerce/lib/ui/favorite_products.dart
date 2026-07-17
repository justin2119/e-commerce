import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../domain/wiewmodel/provider/Favorite_Notifier.dart';

class FavoriteProducts extends ConsumerWidget {
  const FavoriteProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteProvider);
    print(favorites);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoris",style: GoogleFonts.abel(
            fontSize: 25,
            fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        leading: Icon(Icons.favorite_sharp),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView.separated(
            itemBuilder: (context, index) {
              final produit=favorites[index];
              return  ListTile(
                onTap: (){
                  context.push(
                      "/detail",
                      extra: produit
                  );
                },
                leading: Card.outlined(
                  child: Image.network(produit.imageUrl),
                ),
                title: Text(produit.name,style: GoogleFonts.abel(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                trailing: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        elevation:5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                        )
                    ),
                    child: Text("Ajouter au panier", style: GoogleFonts.abel(
                        fontSize:15,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange
                    ),)
                )

              );
            },
            separatorBuilder:  (context, index) => Divider(),
            itemCount: favorites.length
        ),
      ),
    );
  }
}