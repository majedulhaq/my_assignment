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
  final TextEditingController _firsttextcontroller = TextEditingController();

  final TextEditingController _secondtextcontroller = TextEditingController();

  double _result = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: _firsttextcontroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text("First Number"), hintText: "First Number"),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _secondtextcontroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text("Second Number"), hintText: "Second Number"),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          _ontapAddtwo();
                        },
                        child: const Text('+', style: TextStyle(fontSize: 30))),
                    TextButton(
                        onPressed: () {
                          _ontapMinustwo();
                        },
                        child: const Text('-', style: TextStyle(fontSize: 30))),
                    TextButton(
                        onPressed: () {
                          _ontapMultiplytwo();
                        },
                        child: const Text('x', style: TextStyle(fontSize: 30))),
                    TextButton(
                        onPressed: () {
                          _ontapDevidetwo();
                        },
                        child: const Text('/', style: TextStyle(fontSize: 30))),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text('Result: ${_result.toStringAsPrecision(3)}',
                  style: const TextStyle(fontSize: 20))
            ],
          ),
        ),
      ),
    );
  }

  void _ontapAddtwo() {
    double firstnum = double.tryParse(_firsttextcontroller.text) ?? 0;
    double secondnum = double.tryParse(_secondtextcontroller.text) ?? 0;
    _result = firstnum + secondnum;
    setState(() {});
  }

  void _ontapMinustwo() {
    double firstnum = double.tryParse(_firsttextcontroller.text) ?? 0;
    double secondnum = double.tryParse(_secondtextcontroller.text) ?? 0;
    _result = firstnum - secondnum;
    setState(() {});
  }

  void _ontapMultiplytwo() {
    double firstnum = double.tryParse(_firsttextcontroller.text) ?? 0;
    double secondnum = double.tryParse(_secondtextcontroller.text) ?? 0;
    _result = firstnum * secondnum;
    setState(() {});
  }

  void _ontapDevidetwo() {
    double firstnum = double.tryParse(_firsttextcontroller.text) ?? 0;
    double secondnum = double.tryParse(_secondtextcontroller.text) ?? 0;
    _result = firstnum / secondnum;
    setState(() {});
  }
}
