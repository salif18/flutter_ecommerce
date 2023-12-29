import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:sugu/global/global_variable.dart';
import 'package:sugu/models/products.dart';

//la classe product panier

class Descriptions extends StatefulWidget {
  const Descriptions({super.key, required this.item});
  final dynamic item;

  @override
  State<Descriptions> createState() => _DescriptionsState();
}

class _DescriptionsState extends State<Descriptions> {

  late dynamic product;
  int quantity = 0;

  @override
  void initState() {
    super.initState();
    product = widget.item;
  }


  List<Widget> notationStars(int notes) {
    switch (notes) {
      case 1:
      case 2:
        return List.generate(1,
            (index) => const Icon(Icons.star, size: 20, color: Colors.amber));
      case 3:
      case 4:
        return List.generate(2,
            (index) => const Icon(Icons.star, size: 20, color: Colors.amber));
      case 5:
      case 6:
        return List.generate(3,
            (index) => const Icon(Icons.star, size: 20, color: Colors.amber));
      case 7:
      case 8:
        return List.generate(4,
            (index) => const Icon(Icons.star, size: 20, color: Colors.amber));
      case 9:
      case 10:
        return List.generate(5,
            (index) => const Icon(Icons.star, size: 20, color: Colors.amber));
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    VariableGlobal variableGlobal = Provider.of<VariableGlobal>(context);
    void Function(Products , int ) addToCart = variableGlobal.addToCart;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
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
              ),
              Container(
                height: 1,
                color: const Color.fromARGB(54, 0, 0, 0),
              ),
              Column(
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
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange[400],
                  ),
                  child: Text(
                    "Add to Cart",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    addToCart(product,1);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
