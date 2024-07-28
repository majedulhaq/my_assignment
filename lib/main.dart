// // Current SDK version: 3.22.1
// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// // import 'package:flutter/src/widgets/app.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   MyApp({super.key});

//   List jamat = [
//     'তাকমীল ফিল হাদীস',
//     'ফযিলত ২য় বর্ষ',
//     'ফযিলত ১ম বর্ষ',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Color(0xAAE0EDDC),
//             title: Text(
//               'ATTENDENCE',
//               style: TextStyle(color: Color(0xAA6A7381)),
//             ),
//             centerTitle: true,
//           ),
//           body: Column(
//             children: [
//               buildtile(jamat[0], Icons.done, 0),
//               buildtile(jamat[1], Icons.dangerous_outlined, 2),
//               buildtile(jamat[2], Icons.add, 3),

//               // ListTile(
//               //   leading: CircleAvatar(),
//               //   title: Text('তাকমীল ফিল হাদীস', style: TextStyle(fontSize: 22)),
//               //   trailing: Icon(Icons.done, size: 30),
//               // ),
//               // ListTile(
//               //   leading: CircleAvatar(),
//               //   title: Text('ফযিলত ২য় বর্ষ', style: TextStyle(fontSize: 22)),
//               //   trailing: Icon(Icons.done, size: 30),
//               // ),
//               // ListTile(
//               //   leading: CircleAvatar(),
//               //   title: Text('ফযিলত ১ম বর্ষ', style: TextStyle(fontSize: 22)),
//               //   trailing: Icon(Icons.done, size: 30, color: Colors.green),
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   ListTile buildtile(String name, IconData icon, int num) {
//     return ListTile(
//         leading: CircleAvatar(
//           child: Text(num.toString()),
//         ),
//         title: Text(name, style: TextStyle(fontSize: 22)),
//         trailing: Icon(icon, size: 30));
//   }
// }
