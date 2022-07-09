
import 'package:flutter/material.dart';

import '../../../components/constants/assets_constant.dart';

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
                  side: const BorderSide(width: 1, color: Colors.white))),
        ));
  }
}
