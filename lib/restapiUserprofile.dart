import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  List products = ['Iphone 15', '20000', 'D620', 'China', 'New'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar:
                AppBar(title: const Text('Product Profile'), centerTitle: true),
            body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        title: Text(products[0],
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                        tileColor: const Color(0xFFECF1F8),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Price: ${products[1]}',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black54)),
                              Text('Model: ${products[2]}',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black54)),
                              Text('Quality: ${products[4]}',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black54)),
                              const Divider(
                                color: Colors.amber,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.red,
                                      ),
                                      label: const Text(
                                        "Edit",
                                        style: TextStyle(color: Colors.red),
                                      )),
                                  TextButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      label: const Text("Delete",
                                          style: TextStyle(color: Colors.red)))
                                ],
                              )
                            ]));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 15);
                  },
                ))));
  }
}
