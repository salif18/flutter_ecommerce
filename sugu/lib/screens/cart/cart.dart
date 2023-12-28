import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon panier'),
        titleTextStyle: GoogleFonts.roboto(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 28),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Icon(Icons.shopping_cart_outlined,
                size: 33, color: Colors.deepOrange[400]),
          ),
        ],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
