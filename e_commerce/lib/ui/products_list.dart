import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';


class ProductList extends ConsumerWidget {
  const ProductList({super.key});
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des produits",style: GoogleFonts.abel(
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body:Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                ),
                children: [
                  Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepOrange
                          ),
                        ),
                        Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black
                              ),
                              child: Text("New",
                                style: GoogleFonts.abel(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                        ),
                        Positioned(
                            bottom: 10,
                            right: 10,
                            child: Icon(Icons.favorite,color: Colors.white,size: 30,)
                        ),
                      ]
                  ),
                  Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepOrange
                          ),
                        ),
                        Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black
                              ),
                              child: Text("New",
                                style: GoogleFonts.abel(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                        ),
                        Positioned(
                            bottom: 10,
                            right: 10,
                            child: Icon(Icons.favorite,color: Colors.white,size: 30,)
                        ),
                      ]
                  ),
                  Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepOrange
                          ),
                        ),
                        Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black
                              ),
                              child: Text("New",
                                style: GoogleFonts.abel(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                        ),
                        Positioned(
                            bottom: 10,
                            right: 10,
                            child: Icon(Icons.favorite,color: Colors.white,size: 30,)
                        ),
                      ]
                  ),
                  Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepOrange
                          ),
                        ),
                        Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black
                              ),
                              child: Text("New",
                                style: GoogleFonts.abel(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                        ),
                        Positioned(
                            bottom: 10,
                            right: 10,
                            child: Icon(Icons.favorite,color:Colors.white,size: 30,)
                        ),
                      ]
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
