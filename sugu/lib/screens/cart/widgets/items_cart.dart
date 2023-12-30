import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sugu/global/global_variable.dart';

class ItemsCart extends StatelessWidget {
  final dynamic item;
  const ItemsCart({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    VariableGlobal global = Provider.of<VariableGlobal>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
              leading: Image.asset(item.image, width: 80, height: 80),
              title: Text(item.name,
                  style: GoogleFonts.roboto(
                      fontSize: 18, fontWeight: FontWeight.w500)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text("${item.prix} €"),
                ],
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    global.decrement(item);
                  },
                  icon: const Icon(Icons.remove)),
              Text("${item.qty}",
                  style:
                      TextStyle(fontSize: 18, color: Colors.deepOrange[400])),
              IconButton(
                  onPressed: () {
                    global.increment(item);
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          IconButton(
            icon: Icon(Icons.remove_shopping_cart_outlined,
                color: Colors.red[300]),
            onPressed: () {
              global.removeToCart(item);
            },
          ),
        ],
      ),
    );
  }
}
