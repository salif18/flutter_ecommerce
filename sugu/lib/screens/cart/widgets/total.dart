import 'package:flutter/cupertino.dart';
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
              padding: const EdgeInsets.all(15),
              height: 200,
              child: Row(children: [
                const Text("Total:",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                const SizedBox(width: 20),
                Text("${total.toStringAsFixed(2)} €",
                    style: GoogleFonts.roboto(
                        fontSize: 33, color: Colors.deepOrange[400]))
              ])) ;
  }
}