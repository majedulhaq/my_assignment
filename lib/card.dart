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
            backgroundColor: Colors.blue[50],
            title: const Text("Card App"),
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
        child: Padding(
      padding: const EdgeInsets.only(
        top: 300,
        bottom: 350,
        left: 50,
        right: 50,
      ),
      child: Stack(
        children: [
          Container(
            child: Center(
              child: Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      child: Image.asset(
                        "assets/images/me.jpg",
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "মাজেদুল হক",
                        style: TextStyle(
                            fontFamily: "HindSiliguri",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "শিক্ষক",
                        style: TextStyle(
                            fontFamily: "HindSiliguri",
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: SizedBox(
                child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              color: Colors.white70,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                child: Text(
                  'দুপুর ২:০০ টা',
                  style: TextStyle(
                    fontFamily: "HindSiliguri",
                    fontSize: 16,
                  ),
                ),
              )),
            )),
          ),
          Positioned(
            right: 60,
            top: 0,
            child: SizedBox(
                child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20))),
              color: Colors.white70,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 19,
                  vertical: 6,
                ),
                child: Text(
                  'প্রথম সাময়িক পরীক্ষা',
                  style: TextStyle(
                    fontFamily: "HindSiliguri",
                    fontSize: 16,
                  ),
                ),
              )),
            )),
          )
        ],
      ),
    ));
  }
}
