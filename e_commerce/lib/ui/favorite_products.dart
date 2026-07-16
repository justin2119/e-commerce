import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteProducts extends ConsumerWidget {
  const FavoriteProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoris",style: GoogleFonts.abel(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            ],
        ),
      ),
    );
  }
}