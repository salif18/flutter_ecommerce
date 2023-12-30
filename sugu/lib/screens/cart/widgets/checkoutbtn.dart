import 'package:flutter/material.dart';
import 'package:sugu/screens/cart/widgets/address_delivery.dart';

class CheckOutBtn extends StatelessWidget {
  const CheckOutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 228, 228, 228),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return const AddresseForm();
            },
          );
        },
        child: const Icon(Icons.monetization_on_outlined,
            size: 30, color: Colors.deepOrange),
      );
  }
}