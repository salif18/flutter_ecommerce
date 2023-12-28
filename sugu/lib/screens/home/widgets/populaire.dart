import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugu/models/products.dart';
import 'package:sugu/screens/details/description.dart';

class MyPopulary extends StatefulWidget {
  const MyPopulary({super.key});

  @override
  State<MyPopulary> createState() => _MyPopularyState();
}

class _MyPopularyState extends State<MyPopulary> {
  final List<Products> products = Products.getProducts();

  @override
  Widget build(BuildContext context) {
    final sliceFive = products.where((element) => element.mode.contains("populaire")).take(5).toList();
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Populaires",
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color:const Color.fromARGB(255, 32, 32, 32)
                ),
              ),
              const Icon(Icons.arrow_forward, size: 33),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 310,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sliceFive.length,
            itemBuilder: (BuildContext context, int index) {
              final item = sliceFive[index];
              return GestureDetector(
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
                child: Container(
                  
                  width: 200,
                  height: 310,
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: item,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color:Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(item.image),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            item.name,
                            style: GoogleFonts.roboto(
                                fontSize: 20, fontWeight: FontWeight.w400 , color:const Color.fromARGB(255, 102, 102, 102)),
                          ),
                          Text("${item.prix} €",
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
