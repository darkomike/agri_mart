
import 'package:flutter/material.dart';

import '../../../components/theme/color_constant.dart';
import '../../../components/widgets/custom_textfeild.dart';

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
          labelStyle: TextStyle(color: ColorConstants.primaryColor),
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

