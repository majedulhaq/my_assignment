import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Shape with ClipPath'),
        ),
        body: Center(
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 300,
              width: 300,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Define your custom shape here
    path.moveTo(0, size.height * 0.5); // Start in the middle of the left side
    path.quadraticBezierTo(size.width * 0.2, size.height * 1.2, size.width,
        size.height * 0.5); // Curved bottom edge
    path.lineTo(size.width, 0); // Top-right corner
    path.lineTo(0, 0); // Top-left corner
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // No need to reclip for this static shape
  }
}
