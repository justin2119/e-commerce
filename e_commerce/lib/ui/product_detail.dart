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
        title: Text(widget.product.name),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  widget.product.imageUrl,
                  fit: BoxFit.cover,
                )
            ),
            const SizedBox(height: 10,),
            Container(
              margin: EdgeInsetsGeometry.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.product.name, style: GoogleFonts.abel(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      )),
                      Text("${widget.product.price} CFA", style: GoogleFonts.abel(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange
                      )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Icon(Icons.star, color: Colors.deepOrange, size: 20),
                          Text("4.5", style: GoogleFonts.abel(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          ))
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(
                            "${widget.product.category}", style: GoogleFonts.abel(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        )),
                      )
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  Text("Description", style: GoogleFonts.abel(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
                  Text("${widget.product.description}", style: GoogleFonts.abel(
                    fontSize: 20,
                  )),
                  Text("Caractéristique", style: GoogleFonts.abel(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Disponibilité",style: GoogleFonts.abel(
                              fontSize: 20,
                              color: Colors.grey.shade800
                          ),),
                          Text("Livraison",style: GoogleFonts.abel(
                              fontSize: 20,
                              color: Colors.grey.shade800
                          ),),
                          Text("Garantie",style: GoogleFonts.abel(
                              fontSize: 20,
                              color: Colors.grey.shade800
                          ),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("En Stock",style: GoogleFonts.abel(
                              fontSize: 20,
                              color: Colors.grey.shade800
                          ),),
                          Text("Garantie",style: GoogleFonts.abel(
                              fontSize: 20,
                              color: Colors.grey.shade800
                          ),),
                          Text("12 mois",style: GoogleFonts.abel(
                              fontSize: 20,
                              color: Colors.grey.shade800
                          ),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.favorite,size: 40,color: Colors.deepOrange,)),
            Expanded(
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      )
                  ),
                  child: Text("Ajouter au panier", style: GoogleFonts.abel(
                      fontSize: 25,
                      color: Colors.deepOrange
                  ),)
              ),
            )
          ],
        ),
      ),
    );
  }
}
