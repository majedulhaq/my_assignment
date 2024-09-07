import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int numberOfShirts = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          title: const Text(
            "My Bag",
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 120,
                        width: constraints.maxWidth * 0.3, // Responsive width
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          child: Image.asset(
                            "assets/images/me.jpg",
                            fit: BoxFit.cover, // Responsive fit
                          ),
                        ),
                      ),
                      SizedBox(width: constraints.maxWidth * 0.05), // Responsive spacing
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "PullOver",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Text(
                                  "Color: ",
                                  style: TextStyle(fontSize: 18),
                                ),
                                const Text(
                                  "Black",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: constraints.maxWidth * 0.1), // Responsive spacing
                                const Text(
                                  "Size: ",
                                  style: TextStyle(fontSize: 16),
                                ),
                                const Text(
                                  "L",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.black12,
                                      child: IconButton(
                                        onPressed: () {
                                          if (numberOfShirts > 0) {
                                            numberOfShirts -= 1;
                                            setState(() {});
                                          }
                                        },
                                        icon: const Icon(Icons.remove),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      numberOfShirts.toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(width: 15),
                                    CircleAvatar(
                                      child: IconButton(
                                        onPressed: () {
                                          numberOfShirts += 1;
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.add),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  '12\$',
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
