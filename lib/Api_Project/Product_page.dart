import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

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
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: "HindSiliguri",
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff89967A), width: 3),
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
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductForm(onAddProduct: _addProduct),
          ),
        ),
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
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product Code: ${product.codeofproduct}',
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black54)),
                  Text('Unit Price: ${product.unitofproduct}',
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black54)),
                  Text('Quantity: ${product.quantityofproduct}',
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black54)),
                  Text('Total Price: ${product.totalofproduct}',
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black54)),
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
                        label: const Text("Delete",
                            style: TextStyle(color: Colors.red)),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 15);
          },
        ),
      ),
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
  TextEditingController productNameController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();
  TextEditingController productCodeController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      productNameController.text = widget.product!.nameofproduct;
      unitPriceController.text = widget.product!.unitofproduct;
      totalPriceController.text = widget.product!.totalofproduct;
      productCodeController.text = widget.product!.codeofproduct;
      productQuantityController.text = widget.product!.quantityofproduct;
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
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Total Price",
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
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Product code",
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
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: Center(
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Color(0xff89967A)),
                        ),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            var newProduct = ProductClass(
                              productNameController.text,
                              unitPriceController.text,
                              totalPriceController.text,
                              '', // Product image is not implemented yet
                              productCodeController.text,
                              productQuantityController.text,
                            );
                            widget.onAddProduct(newProduct);
                            Navigator.pop(context);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            widget.product != null
                                ? "Update Product"
                                : "Add Product",
                            style: const TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
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
  String nameofproduct;
  String unitofproduct;
  String totalofproduct;
  String imageofproduct;
  String codeofproduct;
  String quantityofproduct;
  ProductClass(
    this.nameofproduct,
    this.unitofproduct,
    this.totalofproduct,
    this.imageofproduct,
    this.codeofproduct,
    this.quantityofproduct,
  );
}
