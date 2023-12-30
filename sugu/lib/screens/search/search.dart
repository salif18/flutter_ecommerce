import 'package:flutter/material.dart';
import 'package:sugu/models/products.dart';
import 'package:sugu/screens/search/widgets/result_search.dart';
import 'package:sugu/screens/search/widgets/search_barre.dart';
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

  void handleChange(value){
    setState(() => productsFilter = toSearch(value));
  }

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
    return Scaffold(
      appBar: AppBar(
        title: MySearchBar(
          formkey:_formKey,
          valuesearchController:valuesearchController,
          handleChange:handleChange,
        ),
        titleSpacing: 5,
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
      ),
      body: ResultOfSearch( productsFilter: productsFilter),
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
