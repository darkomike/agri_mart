import 'package:block_agri_mart/components/constants/assets_constant.dart';
import 'package:block_agri_mart/components/theme/color_constant.dart';
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
        title: const Text("Add Product"),
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
                              borderRadius: BorderRadius.circular(20),
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

class ProductPriceTextFeild extends StatelessWidget {
  const ProductPriceTextFeild({
    Key? key,
    required this.data,
    required TextEditingController productPriceController,
  }) : _productPriceController = productPriceController, super(key: key);

  final MediaQueryData data;
  final TextEditingController _productPriceController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: data.size.width - 30,
      margin:
          const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: CustomTextFormField(
          labelStyle:
              TextStyle(color: ColorConstants.greenPantone),
          hintText: 'Product Price ',
          controller: _productPriceController,
          border: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Color(0xFF2A8D48))),
          focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Color(0xFF2A8D48))),
          label: const Text('Product Price')),
    );
  }
}

class ProductNameTextFeild extends StatelessWidget {
  const ProductNameTextFeild({
    Key? key,
    required this.data,
    required TextEditingController productNameController,
  }) : _productNameController = productNameController, super(key: key);

  final MediaQueryData data;
  final TextEditingController _productNameController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: data.size.width - 30,
      margin:
          const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: CustomTextFormField(
          labelStyle:
              TextStyle(color: ColorConstants.greenPantone),
          hintText: 'Product Name',
          controller: _productNameController,
          border: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Color(0xFF2A8D48))),
          focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Color(0xFF2A8D48))),
          label: const Text('Product Name')),
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.data,
    required TextEditingController productDescriptionController,
  })  : _productDescriptionController = productDescriptionController,
        super(key: key);

  final MediaQueryData data;
  final TextEditingController _productDescriptionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: data.size.width - 30,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: CustomTextFormField(
          minLines: 3,
          maxLines: 5,
          labelStyle: TextStyle(color: ColorConstants.greenPantone),
          hintText: 'Product Description ',
          controller: _productDescriptionController,
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xFF2A8D48))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xFF2A8D48))),
          label: const Text('Product Description')),
    );
  }
}

class AddProductButton extends StatelessWidget {
  const AddProductButton({
    Key? key,
    required this.data,
  }) : super(key: key);

  final MediaQueryData data;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: data.size.width - 30,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: MaterialButton(
          color: ColorConstants.someRockGreen,
          height: 50,
          onPressed: () {
            //TODO: Add product function...
          },
          child: const Text(
            "Add Product",
            style: TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

class SelectProductImage extends StatelessWidget {
  const SelectProductImage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final MediaQueryData data;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        width: data.size.width - 30,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(AssetsConstant.bgPic), fit: BoxFit.cover)),
        child: Center(
          child: MaterialButton(
              height: 50,
              onPressed: () {
                //TODO: Select Image function...
              },
              child: const Text(
                "Select Product Image",
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(width: 1, color: Colors.white))),
        ));
  }
}
