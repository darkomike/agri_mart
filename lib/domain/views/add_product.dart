import 'package:flutter/material.dart';

import '../../components/widgets/custom_app_drawer.dart';
import '../../components/widgets/custom_textfeild.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final _productNameController = TextEditingController();
  final _productPriceController = TextEditingController();

  final productName = 'Product Name';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: Center(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      height: 50,
                      width: 250,
                      hintText: productName,
                        controller: _productNameController, border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFF2A8D48))),
                        label: Text(productName))
                  ],
                ),
              ))),
    );
  }
}
