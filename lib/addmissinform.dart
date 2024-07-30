import 'package:flutter/material.dart';
import 'package:my_assignment/studentifno.dart';

class Addform extends StatefulWidget {
  const Addform({super.key});

  @override
  State<Addform> createState() => _AddformState();
}

class _AddformState extends State<Addform> {
  TextEditingController namecon = TextEditingController();
  TextEditingController jamatcon = TextEditingController();
  TextEditingController numbercon = TextEditingController();
  TextEditingController gardiancon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFCFFFF),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "আপনার নাম লিখুন",
                  style: TextStyle(
                    fontSize: 23,
                    color: Color(0xff89967A),
                    fontFamily: "HindSiliguri",
                  ),
                ),
                TextFormField(
                  controller: namecon,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff89967A)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "জামাতের নাম লিখুন",
                  style: TextStyle(
                    fontSize: 23,
                    color: Color(0xff89967A),
                    fontFamily: "HindSiliguri",
                  ),
                ),
                TextFormField(
                  controller: jamatcon,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff89967A)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "মোবাইল নাম্বার লিখুন",
                  style: TextStyle(
                    fontSize: 23,
                    color: Color(0xff89967A),
                    fontFamily: "HindSiliguri",
                  ),
                ),
                TextFormField(
                  controller: numbercon,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff89967A)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "অভিভাবকের নাম লিখুন",
                  style: TextStyle(
                    fontSize: 23,
                    color: Color(0xff89967A),
                    fontFamily: "HindSiliguri",
                  ),
                ),
                TextFormField(
                  controller: gardiancon,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff89967A)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xff89967A)),
                  ),
                  onPressed: () {
                    // Create a StudentInfo instance with the input data
                    StudentInfo student = StudentInfo(
                      namecon.text,
                      jamatcon.text,
                      numbercon.text,
                      gardiancon.text,
                    );

                    // Navigate to Stinfo screen and pass the student data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Stinfo(student: student),
                      ),
                    );
                  },
                  child: const Text(
                    "সেইভ করুন",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontFamily: "HindSiliguri",
                    ),
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

class StudentInfo {
  String stname;
  String classname;
  String number;
  String gardianname;

  StudentInfo(this.stname, this.classname, this.number, this.gardianname);
}
