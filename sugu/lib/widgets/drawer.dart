import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView( 
        children: [ 
          const DrawerHeader(
            padding:  EdgeInsets.all(20),
            child: ClipRect(),
            ), 
          ListTile(
            onTap: (){},
            title: Text("Profil", style:GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500)),
            leading: const Icon(Icons.person, size:30),
          ), 
         
           ListTile(
            onTap: (){},
            title: Text("Parametre", style:GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500)),
            leading: const Icon(Icons.settings_outlined, size:30),
          ),
           ListTile(
            onTap: (){},
            title: Text("Security", style:GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500)),
            leading: const Icon(Icons.security_sharp, size:30),
          ),
          
        ],
      ),
    );
  }
}