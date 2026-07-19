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
        actions: [
          IconButton(onPressed: (){
            ref.read(cartProvider.notifier).clearCart();
          }, icon: Icon(Icons.delete))
        ],
      ),
      body:Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index){
                    final product = cart[index];
                    return ListTile(
                      leading:Card.outlined(
                        child: Image.network(
                          product.product.imageUrl,
                          width: 100,
                          height: 100,
                      )),
                      title: Text(product.product.name,
                        style: GoogleFonts.abel(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text("${product.product.price} CFA"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: () {
                            ref.read(cartProvider.notifier).removeFromCart(product.product);
                          }, icon:Icon(Icons.delete),),
                          IconButton(onPressed: (){
                            ref.read(cartProvider.notifier).increment(product.product);
                          }, icon:Icon(Icons.add)),
                          Text("${product.quantity}", style: GoogleFonts.abel()),
                          IconButton(onPressed: (){
                            ref.read(cartProvider.notifier).decrement(product.product);
                          }, icon:Icon(Icons.remove)),
                        ],
                      )
                    );
                  },
                  separatorBuilder: (context, index) => Divider(height: 5,),
                  itemCount: cart.length
              ),
            ),
            SizedBox(height: 10,),
            
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 8,
          color: Colors.deepOrange,
          child: Row(
            children:[
              Expanded(
                  child:Text("Total: ${ref.watch(cartProvider.notifier).totalPrice.toStringAsFixed(2) } CFA",
                    style:GoogleFonts.abel(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ) ,
                  ),
                ),
              InkWell(
                onTap: (){},
                child: Container(
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payer",
                        style: GoogleFonts.abel(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange
                        ),
                      ),
                      Icon(Icons.payment,
                        size: 30,
                      )
                    ],
                  ),
                )
              )
            ],
          )
      ),
    ) ;
  }
}
