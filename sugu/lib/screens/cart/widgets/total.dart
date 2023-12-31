import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalWidget extends StatelessWidget {
  final dynamic total;
  const TotalWidget({
    super.key,required this.total,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Colors.deepOrange[400],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
              padding: const EdgeInsets.all(15),
              height: 100,
              child: Row(children: [
                const Text("Total:",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
                const SizedBox(width: 20),
                Text("${total.toStringAsFixed(2)} Fcfa",
                    style: GoogleFonts.roboto(
                        fontSize: 25, color: const Color.fromARGB(255, 255, 255, 255)))
              ])) ;
  }
}