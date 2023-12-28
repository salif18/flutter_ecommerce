import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugu/screens/categorys/categories.dart';

class MyBtnCategory extends StatefulWidget {
  const MyBtnCategory({super.key});

  @override
  State<MyBtnCategory> createState() => _MyBtnCategoryState();
}

class _MyBtnCategoryState extends State<MyBtnCategory> {
  //list des category
  final List<dynamic> categoryList = [
    {
      "value": "All",
      "color": Colors.deepOrange[400],
      "icon": Icons.grid_view_outlined
    },
    {
      "value": "Enfant",
      // "color": const Color.fromARGB(255, 69, 123, 223),
      "color":Colors.grey[200],
      "icon": Icons.child_care_outlined
    },
    {
      "value": "Femme",
      // "color": const Color.fromARGB(255, 60, 24, 160),
      "color":Colors.grey[200],
      "icon": Icons.woman_outlined,
    },
    {
      "value": "Homme",
      // "color": const Color.fromARGB(255, 99, 100, 184),
      "color":Colors.grey[200],
      "icon": Icons.man_3_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Categories",
                style: GoogleFonts.roboto(
                    fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final item = categoryList[index];
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryScreen()));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: 140,
                    decoration: BoxDecoration(
                        color: item['color'] as Color,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 2),
                          Text(item['value'],
                              style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  color: item["value"] == "All" ? Colors.white :const Color.fromARGB(255, 97, 97, 97),
                                  fontWeight: FontWeight.w500)),
                                   const SizedBox(width: 5),
                          Icon(item["icon"], size: 33, color: item["value"] == "All" ? Colors.white : const Color.fromARGB(255, 97, 97, 97)),
                           const SizedBox(width: 2),
                        ]),
                  ),
                );
              },
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
