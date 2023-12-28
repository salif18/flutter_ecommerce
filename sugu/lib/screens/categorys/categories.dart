import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Products",
              style: GoogleFonts.roboto(
                  fontSize: 22, fontWeight: FontWeight.w500)),
          centerTitle: true,
          toolbarHeight: 100,
          bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.deepOrange[400],
              indicatorWeight: 2.3,
              tabs: [
                Tab(
                    child: Text("Accessoires",
                        style: GoogleFonts.roboto(
                            fontSize: 19,
                            color: const Color.fromARGB(255, 114, 114, 114)))),
                Tab(
                    child: Text("Chaussures",
                        style: GoogleFonts.roboto(
                            fontSize: 19,
                            color: const Color.fromARGB(255, 114, 114, 114)))),
                Tab(
                    child: Text("vetements",
                        style: GoogleFonts.roboto(
                            fontSize: 19,
                            color: const Color.fromARGB(255, 114, 114, 114)))),
                Tab(
                    child: Text("Electromenagers",
                        style: GoogleFonts.roboto(
                            fontSize: 19,
                            color: const Color.fromARGB(255, 114, 114, 114)))),
                Tab(
                    child: Text("Gadgets",
                        style: GoogleFonts.roboto(
                            fontSize: 19,
                            color: const Color.fromARGB(255, 114, 114, 114)))),
                Tab(
                    child: Text("Autres",
                        style: GoogleFonts.roboto(
                            fontSize: 19,
                            color: const Color.fromARGB(255, 114, 114, 114)))),
              ]),
        ),
        body: const TabBarView(
          children: [
            Tab(child: Text("1")),
            Tab(child: Text("2")),
            Tab(child: Text("3")),
            Tab(child: Text("4")),
            Tab(child: Text("5")),
            Tab(child: Text("6")),
          ],
        ),
      ),
    );
  }
}
