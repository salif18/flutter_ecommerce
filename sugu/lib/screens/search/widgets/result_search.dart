import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugu/screens/details/description.dart';

class ResultOfSearch extends StatelessWidget {
  final dynamic productsFilter;

  const ResultOfSearch({
    super.key,
    required this.productsFilter,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: productsFilter.length,
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 5),
      itemBuilder: (BuildContext context, int index) {
        if (productsFilter.isEmpty) {
          return Text(
            "Produit non disponible",
            style: GoogleFonts.roboto(fontSize: 20),
          );
        }

        final item = productsFilter[index];

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
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Descriptions(item: item),
                );
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
            ),
            height: 100,
            child: ListTile(
              leading: Image.asset(item.image, width: 80, height: 80),
              title: Text(item.name,
                  style: GoogleFonts.roboto(
                      fontSize: 18, fontWeight: FontWeight.w500)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.category,
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: const Color.fromARGB(255, 133, 133, 133))),
                  const SizedBox(height: 5),
                  Text("${item.prix} €"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
