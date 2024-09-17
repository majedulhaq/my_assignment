import 'package:flutter/material.dart';
import 'package:my_assignment/Api_Project/Product_page.dart';

class ProductUpdate extends StatefulWidget {
  const ProductUpdate({super.key});

  @override
  State<ProductUpdate> createState() => _ProductUpdateState();
}

class _ProductUpdateState extends State<ProductUpdate> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();
  TextEditingController productImageUrlController = TextEditingController();
  TextEditingController productCodeController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<ProductClass> listOfProducts = [];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update the Product'),
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
                    "Product Image",
                    style: TextStyle(
                      fontSize: 23,
                      color: Color(0xff89967A),
                    ),
                  ),
                  TextFormField(
                    controller: productImageUrlController,
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
                          ProductClass productDetails = ProductClass(
                              productNameController.text,
                              unitPriceController.text,
                              totalPriceController.text,
                              productImageUrlController.text,
                              productCodeController.text,
                              productQuantityController.text);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductInfos(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text(
                            "Update",
                            style: TextStyle(
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
