import 'package:flutter/material.dart';

import '../../../components/theme/color_constant.dart';
import '../../../components/widgets/custom_textfeild.dart';

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
          TextStyle(color: ColorConstants.primaryColor),
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
