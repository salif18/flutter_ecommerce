import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageCartEmpty extends StatelessWidget {
  const MessageCartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(50),
      child:
          Text('Votre panier est vide , faites vite le plein de votre panier',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[400],
              )),
    ));
  }
}
