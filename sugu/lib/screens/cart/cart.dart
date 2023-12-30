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
                                  Text("${item.qty}",
                                      style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: const Color.fromARGB(
                                              255, 133, 133, 133))),
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
                    ))
              else
                const Text('Panier vide'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.all(15),
                height: MediaQuery.of(context).size.height * 0.8,
                child: Form(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child:Text('Addresse de livraison',style:GoogleFonts.roboto(fontSize:20, fontWeight: FontWeight.w600)),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Ville",
                          hintStyle: TextStyle(fontSize:18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.home_work_outlined, size:20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Quartier",
                          hintStyle: TextStyle(fontSize:18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.location_city_outlined, size:20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Rue",
                          hintStyle: TextStyle(fontSize:18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.roundabout_right_sharp, size:20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Porte",
                          hintStyle: TextStyle(fontSize:18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.door_back_door, size:20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "log",
                          hintStyle: TextStyle(fontSize:18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.home_outlined, size:20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      const Center(child:Text('ou',style:TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
                      const SizedBox(height:20),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding:const EdgeInsets.all(5),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),color:Colors.black
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             const Icon(Icons.location_on_outlined, size:30, color:Colors.white),
                             Text('Envoyer votre position', style:GoogleFonts.roboto(fontSize:20, color:Colors.white))
                          ]),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange[400],
                              ),
                              onPressed: () {},
                              child: Text("Commander",
                                  style: GoogleFonts.roboto(
                                      fontSize: 20, color: Colors.white))))
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.monetization_on_outlined,
            size: 30, color: Colors.white),
      ),
      bottomNavigationBar:
      cart.isNotEmpty ?
                Container(
                    padding: const EdgeInsets.all(15),
                    height: 200,
                    child: Row(children: [
                      const Text("Total:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      const SizedBox(width: 20),
                      Text("${global.total.toStringAsFixed(2)} €",
                          style: GoogleFonts.roboto(
                              fontSize: 33, color: Colors.deepOrange[400]))
                    ])):null,
    );
  }
}
