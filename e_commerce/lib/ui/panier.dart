import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../domain/wiewmodel/provider/panier_Notifier.dart';

class Panier extends ConsumerWidget {
  const Panier({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    print(cart);
    return Scaffold(
      appBar: AppBar(
        title: Text("Panier des produit"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body:Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) =>Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.deepOrange,
                      ),
                      Text("Nom du Produits"),
                      Row(
                        children: [
                          IconButton(onPressed: () {}, icon:Icon(Icons.delete),),
                          IconButton(onPressed: (){}, icon:Icon(Icons.add)),
                          Text("1"),
                          IconButton(onPressed: (){}, icon:Icon(Icons.remove)),
                        ],
                      )
                    ],
                  ),
                  separatorBuilder: (context, index) => Divider(height: 5,),
                  itemCount: 10
              ),
            )
          ],
        ),
      )
    ) ;
  }
}
