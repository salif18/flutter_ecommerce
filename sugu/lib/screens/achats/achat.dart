import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugu/widgets/bottom_navigator_bar.dart';

class MyPurchaces extends StatefulWidget {
  const MyPurchaces({super.key,required this.currentIndex , required this.changeScreen});

 
 final dynamic currentIndex ; 
 final dynamic changeScreen;

  @override
  State<MyPurchaces> createState() => _MyPurchacesState();
}

class _MyPurchacesState extends State<MyPurchaces> {

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
        title: const Text("Mes Achats"),
        titleTextStyle:
            GoogleFonts.roboto(fontSize: 20,color:Colors.black, fontWeight: FontWeight.w500),
        centerTitle: true,
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
        ),
      ),
       bottomNavigationBar: MyBottomNavigator(currentIndex: currentIndex, changeScreen: changeScreen),
    );
  }
}
