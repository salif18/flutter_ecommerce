import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddresseForm extends StatefulWidget {
  const AddresseForm({super.key});

  @override
  State<AddresseForm> createState() => _AddresseFormState();
}

class _AddresseFormState extends State<AddresseForm> {
  @override
  Widget build(BuildContext context) {
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
                          fontSize: 20, fontWeight: FontWeight.w600))),
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
                        const SizedBox(width: 15),
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
                  onTap: () {},
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepOrange[400],
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 15),
                            const Icon(Icons.send_outlined,
                                size: 30, color: Colors.white),
                            const SizedBox(width: 20),
                            Text("Commander",
                                style: GoogleFonts.roboto(
                                    fontSize: 20, color: Colors.white))
                          ])))
            ],
          ),
        ),
      ),
    );
  }
}
