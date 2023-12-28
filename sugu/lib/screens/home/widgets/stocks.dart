import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugu/models/products.dart';
import 'package:sugu/screens/details/description.dart';

class MyStocks extends StatefulWidget {
  const MyStocks({super.key});

  @override
  State<MyStocks> createState() => _MyStocksState();
}

class _MyStocksState extends State<MyStocks> {
  final List<Products> products = Products.getProducts();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Nos stocks',
                  style: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 32, 32, 32))),
              const Icon(Icons.arrow_forward, size: 33),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 50,
              ),
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final item = products[index];
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                              padding: const EdgeInsets.all(15),
                              height: MediaQuery.of(context).size.height * 0.8,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              child: Descriptions(item: item));
                        });
                  },
                  child: SizedBox(
                    child: Column(
                      children: [
                        Hero(
                          tag: item,
                          child: Container(
                            width: 200,
                            height: 135,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape:BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(item.image))),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(item.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Color.fromARGB(255, 102, 102, 102))),
                              Text("${item.prix} €",
                                  style: GoogleFonts.lato(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrange))
                            ])
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
