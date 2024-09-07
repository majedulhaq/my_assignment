import 'package:flutter/material.dart';
import 'package:my_assignment/checkbox.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: "HindSiliguri",
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff89967A), width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff89967A), width: 1.5),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}
