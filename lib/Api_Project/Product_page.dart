import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff89967A), width: 4),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff89967A), width: 1.5),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ProductInfos(),
    );
  }
}

class ProductInfos extends StatefulWidget {
  List<ProductClass> products = [];

  ProductInfos({super.key});

  @override
  _ProductInfosState createState() => _ProductInfosState();
}

class _ProductInfosState extends State<ProductInfos> {
  @override
  void initState() {
    super.initState();
    getProductList(); // Fetch API data when the widget initializes
  }

  Future<void> getProductList() async {
    Uri url = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      List<ProductClass> fetchedProducts = [];
      for (var item in jsonResponse['data']) {
        ProductClass productClass = ProductClass(
          productId: item['_id'],
          nameofproduct: item['ProductName'],
          unitofproduct: item['UnitPrice'],
          totalofproduct: item['TotalPrice'],
          codeofproduct: item['ProductCode'],
          quantityofproduct: item['Qty'],
          createdDate: item['CreatedDate'],
        );
        fetchedProducts.add(productClass);
      }
      setState(() {
        widget.products = fetchedProducts;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductForm(onAddProduct: _addProduct),
            ),
          ).then((_) {
            // Clear the form fields after adding a new product
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Product Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: widget.products.length,
          itemBuilder: (BuildContext context, int index) {
            var product = widget.products[index];
            return ListTile(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              title: Text(product.nameofproduct,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              tileColor: const Color(0xFFECF1F8),
              subtitle: productShow(product, context, index),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 15);
          },
        ),
      ),
    );
  }

  Column productShow(ProductClass product, BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Unit Price: ${product.unitofproduct}',
            style: const TextStyle(fontSize: 20, color: Colors.black54)),
        Text('Total Price: ${product.totalofproduct}',
            style: const TextStyle(fontSize: 20, color: Colors.black54)),
        Text('Product Code: ${product.codeofproduct}',
            style: const TextStyle(fontSize: 20, color: Colors.black54)),
        Text('Product ID: ${product.productId}',
            style: const TextStyle(fontSize: 20, color: Colors.black54)),
        Text('Quantity: ${product.quantityofproduct}',
            style: const TextStyle(fontSize: 20, color: Colors.black54)),
        const Divider(
          color: Colors.amber,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton.icon(
              onPressed: () {
                // Navigate to the ProductForm with the product to edit
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductForm(
                      onAddProduct: (updatedProduct) =>
                          _updateProduct(index, updatedProduct),
                      product: product,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.red,
              ),
              label: const Text(
                "Edit",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                _deleteProduct(index);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              label: const Text("Delete", style: TextStyle(color: Colors.red)),
            )
          ],
        )
      ],
    );
  }

  void _addProduct(ProductClass product) {
    setState(() {
      widget.products.add(product);
    });
  }

  void _updateProduct(int index, ProductClass updatedProduct) {
    setState(() {
      widget.products[index] = updatedProduct;
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      widget.products.removeAt(index);
    });
  }
}

class ProductForm extends StatefulWidget {
  final Function(ProductClass) onAddProduct;
  final ProductClass? product;

  const ProductForm({super.key, required this.onAddProduct, this.product});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  TextEditingController productIdController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();
  TextEditingController productCodeController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();
  TextEditingController createdDateController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    if (widget.product != null) {
      productIdController.text = widget.product!.productId;
      productNameController.text = widget.product!.nameofproduct;
      unitPriceController.text = widget.product!.unitofproduct;
      totalPriceController.text = widget.product!.totalofproduct;
      productCodeController.text = widget.product!.codeofproduct;
      productQuantityController.text = widget.product!.quantityofproduct;
      createdDateController.text = widget.product!.createdDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.product != null ? 'Edit Product' : 'Add Product'),
          centerTitle: true,
        ),
        backgroundColor: const Color(0xffFCFFFF),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Product Name",
                    style: TextStyle(
                      fontSize: 23,
                      color: Color(0xff89967A),
                    ),
                  ),
                  TextFormField(
                    controller: productNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff89967A)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a product name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Unit price",
                    style: TextStyle(
                      fontSize: 23,
                      color: Color(0xff89967A),
                    ),
                  ),
                  TextFormField(
                    controller: unitPriceController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff89967A)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a unit price';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Total price",
                    style: TextStyle(
                      fontSize: 23,
                      color: Color(0xff89967A),
                    ),
                  ),
                  TextFormField(
                    controller: totalPriceController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff89967A)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a total price';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Product Code",
                    style: TextStyle(
                      fontSize: 23,
                      color: Color(0xff89967A),
                    ),
                  ),
                  TextFormField(
                    controller: productCodeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff89967A)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a product code';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Product Id",
                    style: TextStyle(
                      fontSize: 23,
                      color: Color(0xff89967A),
                    ),
                  ),
                  TextFormField(
                    controller: productIdController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff89967A)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the created date';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Quantity",
                    style: TextStyle(
                      fontSize: 23,
                      color: Color(0xff89967A),
                    ),
                  ),
                  TextFormField(
                    controller: productQuantityController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff89967A)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a quantity';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            ProductClass newProduct = ProductClass(
                              productId: productIdController.text,
                              nameofproduct: productNameController.text,
                              unitofproduct: unitPriceController.text,
                              totalofproduct: totalPriceController.text,
                              codeofproduct: productCodeController.text,
                              quantityofproduct: productQuantityController.text,
                              createdDate: createdDateController.text,
                            );
                            widget.onAddProduct(newProduct);
                            Navigator.pop(
                                context); // Go back to the previous page
                          }
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.product != null ? 'Update' : 'Add Product',
                              style: TextStyle(fontSize: 22),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductClass {
  String productId;
  String nameofproduct;
  String unitofproduct;
  String totalofproduct;
  String codeofproduct;
  String quantityofproduct;
  String createdDate;

  ProductClass({
    required this.productId,
    required this.nameofproduct,
    required this.unitofproduct,
    required this.totalofproduct,
    required this.codeofproduct,
    required this.quantityofproduct,
    required this.createdDate,
  });
}
