import 'package:flutter/material.dart';

class Addform extends StatefulWidget {
  const Addform({super.key});

  @override
  State<Addform> createState() => _AddformState();
}

class _AddformState extends State<Addform> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "আপনার নাম লিখুন",
                  style: TextStyle(fontSize: 23, color: Color(0xff89967A)),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff89967A))),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "জামাতের নাম লিখুন",
                  style: TextStyle(fontSize: 23, color: Color(0xff89967A)),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff89967A))),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "মোবাইল নাম্বার লিখুন",
                  style: TextStyle(fontSize: 23, color: Color(0xff89967A)),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff89967A))),
                  ),
                ),
                const SizedBox(height: 20),
                const Text("অভিভাবকের নাম লিখুন"),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff89967A))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
