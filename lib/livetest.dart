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
            title: const Text("Text Styling App"),
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
            'Flutter Text Styling',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Experiment with text styles',
            style: TextStyle(
              fontSize: 16.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text('You clicked the button!'),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('Click Me')),
          const SizedBox(height: 10),
          RichText(
            text: const TextSpan(
              text: 'Welcome to ', // Regular text
              style: TextStyle(
                color: Colors.black, // Default color for text
                fontSize: 18.0, // Font size
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Flutter', // Text to be colored differently
                  style: TextStyle(
                    color: Colors.blue, // Green color for "Flutter"
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
