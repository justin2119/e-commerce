import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../domain/models/product.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details",
          style: GoogleFonts.abel(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.4,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                widget.product.imageUrl,
                fit: BoxFit.cover,
              )
            ),
            const SizedBox(height: 10,),
            Text("${widget.product.name}",style: GoogleFonts.abel(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Prix : ${widget.product.price} CFA",style: GoogleFonts.abel(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )),
                Row(
                  children: [
                    IconButton(onPressed: () {  }, icon: const Icon(Icons.control_point_outlined, color: Colors.deepOrange,size:40,)),
                    Text("12", style: GoogleFonts.abel()),
                    IconButton(onPressed: () {  }, icon: const Icon(Icons.do_disturb_on_outlined, color: Colors.deepOrange,size: 40,)),
                  ],
                )
              ]
            ),
            const SizedBox(height:2,),
            Text("Description",style: GoogleFonts.abel(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
            Text("${widget.product.description}",style: GoogleFonts.abel(
              fontSize: 20,
            )),
            const SizedBox(height: 10,),
            Text("Catégorie : ${widget.product.category}",style: GoogleFonts.abel(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        elevation:5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    child: Text("Achetez maintenant", style: GoogleFonts.abel(
                        fontSize: 25,
                        color: Colors.deepOrange
                    ),)
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        elevation:5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    child: Text("Ajouter au panier", style: GoogleFonts.abel(
                        fontSize: 25,
                    ),)
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}
