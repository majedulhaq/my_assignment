// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Responsivedesign(),
      ),
    );
  }
}

class Responsivedesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return LaptopOrLargeScreen();
        } else if (constraints.maxWidth >= 800) {
          return TabletLayout();
        } else {
          return MobileLayout();
        }
      },
    );
  }
}

class LaptopOrLargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Humming\nBird',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('Episodes',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('About',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 150),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'FLUTTER WEB.\nTHE BASICS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                        "In this course we will go over the basics of using Flutter Web for development. Topics will includeResponsive Layout, Deploying, Font Changes, Hoverfunctionality, Modals and more.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              SizedBox(width: 100),
              ElevatedButton(
                  onPressed: null,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Join Course",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Color(0xff00AF7C)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(5)))))),
              SizedBox(width: 100),
            ],
          ),
        ],
      ),
    );
  }
}

class TabletLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            Row(
              children: [
                SizedBox(width: 20),
                Text('Humming\nBird',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                Expanded(child: SizedBox(width: 20)),
                Text('Episodes',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                SizedBox(width: 50),
                Text('About',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                SizedBox(width: 20)
              ],
            ),
            SizedBox(
              height: 150,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("FLUTTER WEB.\nTHE BASICS",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                        "In this course we will go over the basics of using Flutter Web for development. Topics will includeResponsive Layout, Deploying, Font Changes, Hoverfunctionality, Modals and more.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: 120,
                    ),
                    ElevatedButton(
                        onPressed: null,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Join Course",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Color(0xff00AF7C)),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: const [
              DrawerHeader(
                  decoration: BoxDecoration(
                      color: Color(0xff00AF7C), shape: BoxShape.rectangle),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('SKILL UP NOW',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text('Tap Here',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                              color: Colors.white)),
                    ],
                  ))),
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.message, size: 30),
                      title: Text("Episodes",
                          style: TextStyle(
                            fontSize: 22,
                          )),
                    ),
                    ListTile(
                      leading: Icon(Icons.info_outline, size: 30),
                      title: Text("About",
                          style: TextStyle(
                            fontSize: 22,
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          actions: const [
            Text('Humming\nBird', textAlign: TextAlign.left),
            SizedBox(width: 20)
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("FLUTTER WEB.\nTHE BASICS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                      "HUMMING BIRD.FLUTTER WEB. THE BASICS In this course we will go over the basics of using Flutter Web for development. Topics will includeResponsive Layout, Deploying, Font Changes, Hoverfunctionality, Modals and more.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: 80,
                  ),
                  ElevatedButton(
                      onPressed: null,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Join Course",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Color(0xff00AF7C)),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))))))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
