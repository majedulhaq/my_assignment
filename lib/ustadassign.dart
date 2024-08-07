// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text("Greeting App"),
            centerTitle: true,
          ),
          body: const MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hello, World!',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Welcome to Flutter!',
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
          const SizedBox(height: 15),
          const Image(
            image: NetworkImage(
              "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
              scale: 15.0,
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('Button pressed'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Text(
              'Press Me',
              style: TextStyle(color: Colors.black87),
            ),
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              backgroundColor: WidgetStateProperty.all(Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
