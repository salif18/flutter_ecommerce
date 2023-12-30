import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class SecondWidget extends StatelessWidget {
  final dynamic product;

  const SecondWidget({
    super.key,
    required this.product
    });

  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      "Descriptions",
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: ReadMoreText(
                      product.descriptions,
                      trimLines: 3,
                      trimMode: TrimMode.Line,
                      trimExpandedText: 'reduire',
                      colorClickableText: Colors.deepOrange[400],
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          height: 1.5,
                          color: Colors.grey.withOpacity(0.7)),
                    ),
                  )
                ],
              );
  }
}