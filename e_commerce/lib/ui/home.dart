import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce/domain/wiewmodel/provider/Product_Notifier.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Rechercher un produit......",
            hintStyle: GoogleFonts.abel(),
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.camera_alt),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(5),
            child: Stack(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
                Positioned(
                  right: 0,
                  child: Text("12",style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
            children: [
              SizedBox(height: 10,),
              Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.all(5),
                        height:MediaQuery.of(context).size.height*0.22,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepOrange,
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
                          "Découvrez l'expérience\nd'achat idéale !",
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
              )
            ]),
      )
    );
  }
}
