import 'package:flutter/material.dart';
import 'package:sugu/screens/achats/achat.dart';
import 'package:sugu/screens/favorites/favorites.dart';
import 'package:sugu/screens/home/home.dart';
import 'package:sugu/widgets/drawer.dart';

class MainRoutes extends StatefulWidget {
  const MainRoutes({super.key});

  @override
  State<MainRoutes> createState() => _MainRoutesState();
}

class _MainRoutesState extends State<MainRoutes> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey<ScaffoldState>();

  void changeScreen(index){
    setState(()=> _currentIndex = index );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerkey, 
      drawer:const MyDrawer(),
      body:[
        MyHome(
          currentIndex:_currentIndex , 
          changeScreen:changeScreen
        ),
        MyFavorites(
           currentIndex:_currentIndex , 
           changeScreen:changeScreen
        ),
        MyPurchaces(
            currentIndex:_currentIndex , 
            changeScreen:changeScreen
        ),
        ][_currentIndex],
      // bottomNavigationBar: MyBottomNavigator(
      //   currentIndex:_currentIndex , 
      //   changeScreen:changeScreen
      //   ),
    );
  }
}