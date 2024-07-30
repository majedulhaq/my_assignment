import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Todo> jamat = []; // Define your Todo list
  TextEditingController taskc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Builder(builder: (context) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              TextField(
                                controller: taskc,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    jamat.add(Todo(taskc.text.trim(), false));
                                    setState(() {});
                                    taskc.clear();
                                  },
                                  child: Text('Save'))
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: const Icon(Icons.add),
            ),
            appBar: AppBar(
              backgroundColor: const Color(0xAAE0EDDC),
              title: const Text(
                'Present',
                style: TextStyle(color: Color(0xAA6A7381)),
              ),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: jamat.length,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      
                      child: Text((index + 1).toString()),
                    ),
                    title: Text(jamat[index].task),
                    trailing: IconButton(
                      onPressed: () {
                        jamat[index].isdone = !jamat[index].isdone;
                        setState(() {});
                      },
                      icon: jamat[index].isdone == true
                          ? Icon(Icons.done, color: Colors.green)
                          : Icon(Icons.close, color: Colors.red),
                    ));
              },
            ),
          );
        }),
      ),
    );
  }
}

class Todo {
  String task;
  bool isdone;
  Todo(this.task, this.isdone);
}
