import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: homeScreen(),
  ));
}

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ListTile(
      trailing: Text('Data'),
      title: Text('My Account'),
      subtitle: Text('this a new '),
    ));
  }
}
