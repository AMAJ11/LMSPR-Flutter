import 'package:flutter/material.dart';
import 'package:lmspr/screens/HomeScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homescreen(),);
        }
}
