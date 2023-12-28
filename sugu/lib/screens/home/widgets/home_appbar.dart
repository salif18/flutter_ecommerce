import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugu/screens/cart/cart.dart';
import 'package:sugu/widgets/badge.dart';


class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 20, right: 20),
      height: 100,
      color: Colors.white.withOpacity(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("p'ti Coin",
              style: GoogleFonts.roboto(
                  fontSize: 30, 
                  fontWeight: FontWeight.w600,
                  color:Colors.deepOrange[400]
                )),
          GestureDetector(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyCart()));
            },
            child: Container(
              height: 45,
              width: 45,
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 230, 230),
                border: Border.all(color: const Color.fromARGB(255, 230, 230, 230), width: 1.2),
                borderRadius: BorderRadius.circular(100),
              ),
             child: const Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: -2,
                    child: MyBadge(notifCount: 3),
                  ),
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Color.fromARGB(255, 255, 112, 67),
                    size: 30,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
