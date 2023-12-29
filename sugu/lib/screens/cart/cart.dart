import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sugu/global/global_variable.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    VariableGlobal global = Provider.of<VariableGlobal>(context);
    List<ItemPurchase> cart = global.cart;

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: cart.length,
                itemBuilder: (BuildContext context, int index) {
                  ItemPurchase item = cart[index];
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ListTile(
                            leading:
                                Image.asset(item.image, width: 80, height: 80),
                            title: Text(item.name,
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${item.qty}",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: const Color.fromARGB(
                                            255, 133, 133, 133))),
                                const SizedBox(height: 5),
                                Text("${item.prix} €"),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.remove_shopping_cart_outlined, color:Colors.red[300]),
                          onPressed: () {
                            global.removeToCart(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
