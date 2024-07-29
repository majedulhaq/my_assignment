import 'package:flutter/material.dart';

class Stinfo extends StatefulWidget {
  const Stinfo({super.key});

  @override
  State<Stinfo> createState() => _StinfoState();
}

class _StinfoState extends State<Stinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student info'),
        centerTitle: true,
        backgroundColor: const Color(0xffDFE9EC),
      ),
      body: const Card(
        color: Colors.white60,
        child: SizedBox(
          height: 290,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  backgroundImage: AssetImage("assets/images/me.jpg"),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      'নাম\nজামাত\nমোবাইল\nঅভিভাবক',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 23,
                          fontFamily: "HindSiliguri",
                          fontWeight: FontWeight.w700,
                          color: Color(0xff89967A)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      ':\n:\n:\n:',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 23),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'মাজেদুল হক\nতাকমীল ফিল হাদীস \n01734882559\nনজরুল ইসলাম',
                      style: TextStyle(
                          fontSize: 23,
                          fontFamily: "HindSiliguri",
                          color: Colors.black54),
                      textAlign: TextAlign.left,
                    )
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
