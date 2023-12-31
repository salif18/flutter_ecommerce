import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:sugu/global/authnotifier.dart";
import 'package:sugu/global/global_variable.dart';
import "package:sugu/routes.dart";

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => VariableGlobal()),
      ChangeNotifierProvider(create: (context) => AuthNotifier()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sugu",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      home: const MainRoutes(),
    );
  }
}
