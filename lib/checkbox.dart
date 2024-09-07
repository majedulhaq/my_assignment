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
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // A list to track the number of items for each product
  List<int> numberOfShirts = [0, 0, 0];

  // List of products
  List<Map<String, String>> products = [
    {
      'name': 'PullOver',
      'color': 'Black',
      'size': 'L',
      'price': '30',
    },
    {
      'name': 'T-Shirt',
      'color': 'Grey',
      'size': 'L',
      'price': '20',
    },
    {
      'name': 'Sport Dress',
      'color': 'Black',
      'size': 'M',
      'price': '50',
    },
  ];

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
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = products[index];
            int basePrice = int.parse(product['price']!);
            int totalPrice = basePrice * numberOfShirts[index];

            return LayoutBuilder(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 130,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              child: Image.network(
                                  'https://merchshop.in/wp-content/uploads/2019/08/Flutter-t-shirt-black.jpg'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['name'] ?? '',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Text(
                                      "Color: ",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      product['color'] ?? '',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                        width: constraints.maxWidth * 0.03),
                                    const Text(
                                      "Size: ",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      product['size'] ?? '',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.black12,
                                          child: IconButton(
                                            onPressed: () {
                                              if (numberOfShirts[index] > 0) {
                                                setState(() {
                                                  numberOfShirts[index] -= 1;
                                                });
                                              }
                                            },
                                            icon: const Icon(Icons.remove),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          numberOfShirts[index].toString(),
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                        const SizedBox(width: 8),
                                        CircleAvatar(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                numberOfShirts[index] += 1;
                                              });
                                            },
                                            icon: const Icon(Icons.add),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 15, top: 8, bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Icon(Icons.more_vert_sharp),
                                const SizedBox(height: 60),
                                // Price updated according to the number of shirts
                                Text(
                                  '${totalPrice}\$',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Amount:',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                  Text(
                    '${calculateTotalAmount()}\$',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
  final snackBar = SnackBar(
    content: const Text('Button pressed!'),
    duration: const Duration(seconds: 2), // Optional: adjust the duration
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
},

                    child: const Text(
                      'Checkout',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  // Function to calculate total amount
  int calculateTotalAmount() {
    int total = 0;
    for (int i = 0; i < products.length; i++) {
      int basePrice = int.parse(products[i]['price']!);
      total += basePrice * numberOfShirts[i];
    }
    return total;
  }
}
