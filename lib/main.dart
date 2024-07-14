// Current SDK version: 3.22.1
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      title: 'My App',
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> friendList = [
    'Fahad',
    'Iram',
    'Touhid',
    'Sakib',
    'Niloy',
    'Rahat',
    'Khaled',
    'Sakib',
    'Niloy',
    'Rahat',
    'Khaled'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('my app'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView.separated(
          itemCount: friendList.length,
          itemBuilder: (context, index) {
            return ListTile(
              
              onTap: () {},
              title: Text(friendList[index]),
              subtitle: Text('this is subtitle'),
              leading: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(.3),
                child: Text('${index + 1}'),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 9,
              color: Colors.red.withOpacity(.2),
            );
          },
        ));
  }
}
