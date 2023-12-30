import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstWidget extends StatelessWidget {

  final dynamic product;
  final dynamic notationStars;

  const FirstWidget({
    super.key, 
    required this.product, 
    required this.notationStars,
    });

  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: product,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 150,
                      child: Image.asset(product.image, fit: BoxFit.fill),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        product.name,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: notationStars(product.notes as int)),
                      Text(
                        "${product.prix} €",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 255, 112, 67),
                        ),
                      ),
                    ],
                  )
                ],
              );
  }
}