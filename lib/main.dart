import 'package:bmi/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        // ignore: prefer_const_constructors
        textTheme: TextTheme(
          // ignore: prefer_const_constructors
          headline1: TextStyle(
              color: Colors.white, fontSize: 45, fontWeight: FontWeight.w800),
          headline2: const TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.w800),
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
      ),
      home: const HomePage(),
    );
  }
}
