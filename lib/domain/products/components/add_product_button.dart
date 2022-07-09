import 'package:flutter/material.dart';

import '../../../components/theme/color_constant.dart';

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
            borderRadius: BorderRadius.circular(5),
          ),
        ));
  }
}
