import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorieButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CategorieButton({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        label: Text(text,style:GoogleFonts.abel(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),),
        icon: Icon(Icons.shop_2_sharp,color: Colors.black,),style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6)
      ),
      elevation: 6
    ));
  }
}
