import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Container(
        height: 100,
        width: double.infinity,
        child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            Text("Welcome to !!", style:GoogleFonts.aBeeZee(fontSize: 28, fontWeight: FontWeight.w600, )),
            Text("Bon Coin", style:GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w400,color:Colors.deepOrange[400] ))
          ],
        ),
      ),
    );
  }
}