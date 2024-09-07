import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: GlobalScaffoldMessenger
          .scaffoldMessengerKey, // Added to handle Snackbar
      home: const ProductScreen(),
    );
  }
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<int> numberOfItems = [
    0,
    0,
    0
  ]; // List to track number of items per product

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

  // Function to calculate total price based on the number of items
  int calculateTotalAmount() {
    int total = 0;
    for (int i = 0; i < products.length; i++) {
      int basePrice = int.parse(products[i]['price']!);
      total += basePrice * numberOfItems[i];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          int totalPrice = basePrice * numberOfItems[index];

          return Padding(
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
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Size: ",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              product['size'] ?? '',
                              style: const TextStyle(
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
                                      if (numberOfItems[index] > 0) {
                                        setState(() {
                                          numberOfItems[index]--;
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.remove),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  numberOfItems[index].toString(),
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(width: 8),
                                CircleAvatar(
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        numberOfItems[index]++;
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
                  const SizedBox(width: 20),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 15, top: 8, bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(Icons.more_vert_sharp),
                        const SizedBox(height: 60),
                        // Price updated according to the number of items
                        Text(
                          '${totalPrice}\$',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  // Use the correct scaffoldMessengerKey to show Snackbar
                  GlobalScaffoldMessenger.showSnackBar(
                    const SnackBar(
                      content: Center(
                          child: Text(
                        'Congradulations!',
                        style: TextStyle(fontSize: 25),
                      )),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text(
                  'Checkout',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// Global class to manage ScaffoldMessengerKey
class GlobalScaffoldMessenger {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(SnackBar snackBar) {
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}
