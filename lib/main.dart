import 'package:flutter/material.dart';
import 'package:movieapp/provider/movielist_provider.dart';
import 'package:movieapp/screens/home_screen.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  
  Widget build(BuildContext context) {
    // final loc = Locators();
    // loc.func();
    return ChangeNotifierProvider(
      create: (_) => MovieProvider(),
      child:const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
