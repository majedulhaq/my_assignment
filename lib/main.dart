import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_assignment/Api_Project/prodcut_Form.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
    );

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
      home: const ProductForm(),
    );
  }
}
