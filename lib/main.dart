import 'package:flutter/material.dart';
import 'package:my_assignment/studentifno.dart';

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
                  fontSize: 24))),
      debugShowCheckedModeBanner: false,
      home: Stinfo(),
    );
  }
}
