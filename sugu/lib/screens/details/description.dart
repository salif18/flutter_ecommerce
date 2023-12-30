import 'package:flutter/material.dart';
import 'package:sugu/screens/details/widgets/addbtn.dart';
import 'package:sugu/screens/details/widgets/firstwidget.dart';
import 'package:sugu/screens/details/widgets/secondwidget.dart';

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

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FirstWidget( product:product , notationStars: notationStars),
              const Divider( height: 1, color: Color.fromARGB(54, 0, 0, 0)),
              SecondWidget(product: product),
              AddBtn(product: product)
            ],
          ),
        ),
      ),
    );
  }
}
