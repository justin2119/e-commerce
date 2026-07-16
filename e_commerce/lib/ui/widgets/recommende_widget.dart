import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecommendeWidget extends StatelessWidget {
  const RecommendeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
