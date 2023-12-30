import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sugu/global/global_variable.dart';
import 'package:sugu/models/products.dart';

class AddBtn extends StatelessWidget {
  final dynamic product;
  const AddBtn({
    super.key,
    required this.product,
    });

  @override
  Widget build(BuildContext context) {
    VariableGlobal variableGlobal = Provider.of<VariableGlobal>(context);
    void Function(Products , int ) addToCart = variableGlobal.addToCart;
    return  Container(
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
              ) ;
  }
}