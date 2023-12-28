import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugu/widgets/bottom_navigator_bar.dart';

class MyFavorites extends StatefulWidget {
  const MyFavorites({super.key , required this.currentIndex , required this.changeScreen});
 
 final dynamic currentIndex ; 
 final dynamic changeScreen;

  @override
  State<MyFavorites> createState() => _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites> {

late dynamic currentIndex;
late dynamic changeScreen;

 @override 
 void initState(){
  super.initState();
   currentIndex = widget.currentIndex;
    changeScreen = widget.changeScreen;
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes favoris",
            style:
                GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500)),
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 28),
        ),
      ),
      body: const SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      )),
       bottomNavigationBar: MyBottomNavigator(currentIndex: currentIndex, changeScreen: changeScreen),
    );
  }
}
