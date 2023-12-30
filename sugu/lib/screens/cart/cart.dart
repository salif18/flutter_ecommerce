import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sugu/global/global_variable.dart';


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
                ...cart.map((item) => Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
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
                              leading: Image.asset(item.image,
                                  width: 80, height: 80),
                              title: Text(item.name,
                                  style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
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
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepOrange[400])),
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
                    )),
              const SizedBox(height: 200),
              if (cart.isEmpty)
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Text(
                      'Votre panier est vide , faites vite le plein de votre panier',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[400],
                      )),
                )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 228, 228, 228),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Form(
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text('Une addresse de livraison',
                              style: GoogleFonts.roboto(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Ville",
                            hintStyle: const TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.home_work_outlined,
                                color: Colors.deepOrange[400], size: 20),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Quartier",
                            hintStyle: const TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.location_city_sharp,
                                color: Colors.deepOrange[400], size: 20),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Rue",
                            hintStyle: const TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.roundabout_right_sharp,
                                color: Colors.deepOrange[400], size: 20),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Porte",
                            hintStyle: const TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.door_back_door,
                                color: Colors.deepOrange[400], size: 20),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "logement",
                            hintStyle: const TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.home_outlined,
                                color: Colors.deepOrange[400], size: 20),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Center(
                            child: Text('ou',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600))),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.location_on_outlined,
                                      size: 30, color: Colors.white),
                                      const SizedBox(width: 20),
                                  Text('Envoyer votre position',
                                      style: GoogleFonts.roboto(
                                          fontSize: 20, color: Colors.white))
                                ]),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: (){},
                          child:Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.deepOrange[400],
                            ),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:[
                                const Icon(Icons.send_outlined ,size:30, color:Colors.white),
                                const SizedBox(width: 20),
                                Text("Commander",
                                    style: GoogleFonts.roboto(
                                        fontSize: 20, color: Colors.white))]))
                            )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.monetization_on_outlined,
            size: 30, color: Colors.deepOrange),
      ),
      bottomNavigationBar: cart.isNotEmpty
          ? Container(
              padding: const EdgeInsets.all(15),
              height: 200,
              child: Row(children: [
                const Text("Total:",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                const SizedBox(width: 20),
                Text("${global.total.toStringAsFixed(2)} €",
                    style: GoogleFonts.roboto(
                        fontSize: 33, color: Colors.deepOrange[400]))
              ]))
          : null,
    );
  }
}
