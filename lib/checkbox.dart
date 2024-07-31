import 'package:flutter/material.dart';

class ChBox extends StatefulWidget {
  const ChBox({super.key});

  @override
  State<ChBox> createState() => _ChBoxState();
}

class _ChBoxState extends State<ChBox> {
  bool click = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CheckboxListTile(
              value: click,
              onChanged: (click) {
                click = false;
                setState(() {});
              },
              title: const Text('data'),
              subtitle: const Text("What is the date of "),
            ),
          ],
        ),
      ),
    );
  }
}
