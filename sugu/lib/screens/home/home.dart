import 'package:flutter/material.dart';
import 'package:sugu/screens/home/widgets/baner_message.dart';
import 'package:sugu/screens/home/widgets/boutton_categorie.dart';
import 'package:sugu/screens/home/widgets/carousel.dart';
import 'package:sugu/screens/home/widgets/home_appbar.dart';
import 'package:sugu/screens/home/widgets/nouveaute.dart';
import 'package:sugu/screens/home/widgets/populaire.dart';
import 'package:sugu/screens/home/widgets/stocks.dart';
import 'package:sugu/screens/search/search.dart';
import 'package:sugu/widgets/bottom_navigator_bar.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key, required this.currentIndex , required this.changeScreen});

 final dynamic currentIndex ; 
 final dynamic changeScreen;

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
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
     backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: const SafeArea(
        child: SingleChildScrollView(
          child:Column( 
            children:[
              MyHomeAppBar(),
              MessageWidget(),
              SizedBox(height: 20),
              MyCarousel(),
              SizedBox(height: 20),
              MyBtnCategory(),
              SizedBox(height: 20),
              MyPopulary(),
              SizedBox(height: 20), 
              MyNews(),
              SizedBox(height: 20), 
              MyStocks(),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 112, 67),
        onPressed:(){
         showModalBottomSheet(
          isScrollControlled: true,
          context: context, 
          builder:(BuildContext context){
            return Container(
              padding: const EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * 0.9,
              child: const SearchScreen(),
            );
          }
          );
        }, 
        child:const Icon(Icons.search,size:33, color:Colors.white),
        ),
        bottomNavigationBar: MyBottomNavigator(
          currentIndex: currentIndex, 
          changeScreen: changeScreen
        ),
    );
  }
}