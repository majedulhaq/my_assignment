import 'package:flutter/material.dart';
import 'package:my_assignment/studentform.dart';

class Stinfo extends StatelessWidget {
  final StudentInfo student;

  const Stinfo({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ছাত্র তথ্য'),
        centerTitle: true,
        backgroundColor: const Color(0xffDFE9EC),
      ),
      body: Card(
        color: Colors.white60,
        child: SizedBox(
          height: 290,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  backgroundImage: AssetImage("assets/images/me.jpg"),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    const Text(
                      'নাম\nজামাত\nমোবাইল\nঅভিভাবক',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: "HindSiliguri",
                        fontWeight: FontWeight.w700,
                        color: Color(0xff89967A),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      ':\n:\n:\n:',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 23),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      '${student.stname}\n${student.classname}\n${student.number}\n${student.gardianname}',
                      style: const TextStyle(
                        fontSize: 23,
                        fontFamily: "HindSiliguri",
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
