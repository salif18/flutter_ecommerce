import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sugu/global/global_variable.dart';
import 'package:sugu/screens/cart/widgets/checkoutbtn.dart';
import 'package:sugu/screens/cart/widgets/items_cart.dart';
import 'package:sugu/screens/cart/widgets/message_cart_empty.dart';
import 'package:sugu/screens/cart/widgets/total.dart';


class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {


  @override
  Widget build(BuildContext context) {
    VariableGlobal global = Provider.of<VariableGlobal>(context);
    List<ItemPurchase> cart = global.cart;
    global.calculateTotal();

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
              if (cart.isNotEmpty)
                ...cart.map((item) => ItemsCart(item: item)),
              const SizedBox(height: 200),
              if (cart.isEmpty)
               const MessageCartEmpty(),
            ],
          ),
        ),
      ),
      floatingActionButton: const CheckOutBtn(),
      bottomNavigationBar: cart.isNotEmpty
          ? TotalWidget(total: global.total) : null,
    );
  }
}
