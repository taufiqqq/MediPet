// main.dart
import 'package:flutter/material.dart';
import 'home.dart';
import 'scanner.dart';
import 'disease.dart';
import 'chat.dart';
import 'petcare.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        '/home': (context) => Home(),
        '/scanner': (context) => Scanner(),
        '/disease': (context) => Disease(),
        '/chat': (context) => Chat(),
        '/petcare': (context) => Petcare(),
      },
      debugShowCheckedModeBanner: false, // Remove the debug banner
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF9E8D9),
        primaryColor: Color(0xFFFF8F00), // Set primary color
      ),
    );
  }
}
