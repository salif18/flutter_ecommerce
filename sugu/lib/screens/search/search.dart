import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugu/models/products.dart';
import 'package:sugu/screens/details/description.dart';
// import 'package:sugu/screens/search/widgets/search_barre.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final valuesearchController = TextEditingController();
  final List<Products> products = Products.getProducts();

  //resultats des recherches
  List<Products> productsFilter = [];

//fonction de recherche
  List<Products> toSearch(value) {
     if(value.length > 0){
     return products
        .where((product) =>
            product.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
     }
     return [];
  }

  @override
  Widget build(BuildContext context) {
    // final productsFilter = toSearch(valuesearchController.text);
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: valuesearchController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Aucune valeur à rechercher ?";
                  }
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child:Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 112, 67),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child:  IconButton(
                  onPressed: () {
                    final value = valuesearchController.text;
                    setState(() => productsFilter = toSearch(value));
                  },
                  icon: const Icon(Icons.search_outlined,
                      size: 35, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        titleSpacing: 5,
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
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
      ),
      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        child: FloatingActionButton(
          backgroundColor: Colors.deepOrange[400],
          onPressed: () {
            Navigator.pop(context);
          },
          child:
              const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}
