import 'package:block_agri_mart/components/theme/color_constant.dart';
import 'package:block_agri_mart/domain/products/components/product_description.dart';
import 'package:block_agri_mart/domain/products/components/product_name.dart';
import 'package:block_agri_mart/domain/products/components/product_price.dart';
import 'package:block_agri_mart/domain/products/components/select_product_image.dart';
import 'package:flutter/material.dart';
import '../../../components/widgets/custom_textfeild.dart';
import 'add_product_button.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _productDescriptionController = TextEditingController();

  final List<String> _productCategory = [
    "Vegetables",
    "Fruits",
    "Poultry",
    "Cereals"
  ];
  String _selectedProductCategory = "Vegetables";

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title:  Text("Add Product"       ,   style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 22),
      ),
        elevation: 0.2,
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProductNameTextFeild(data: data, productNameController: _productNameController),
                  ProductPriceTextFeild(data: data, productPriceController: _productPriceController),
                  SizedBox(
                    height: 70,
                    // color: Colors.red,
                    width: data.size.width,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Select category: ",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            height: 35,
                            width: 150,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1.5,
                                  color: ColorConstants.greenPantone),
                            ),
                            child: DropdownButton<String>(
                              style: const TextStyle(color: Colors.black),
                                elevation: 20,
                                dropdownColor: ColorConstants.someRockGreen,
                                underline: Container(),
                                value: _selectedProductCategory,
                                items: _productCategory.map((String value) {
                                  return DropdownMenuItem<String>(
                                    child: Text(value),
                                    value: value,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(
                                      () => _selectedProductCategory = value!);
                                }),
                          ),
                        ]),
                  ),
                  ProductDescription(
                      data: data,
                      productDescriptionController:
                          _productDescriptionController),
                  SelectProductImage(data: data),
                  AddProductButton(data: data)
                ],
              ),
            ),
          )),
    );
  }
}

