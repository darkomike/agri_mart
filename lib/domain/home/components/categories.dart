import 'package:flutter/material.dart';

import 'category_cards.dart';
import 'product_list.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.width, required this.availableProductKey,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;
  final  availableProductKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: availableProductKey,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available products',
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            key: UniqueKey(),
            physics: const BouncingScrollPhysics(),
            child: const CategoryCards(),
          ),
          const SizedBox(
            height: 10,
          ),
          AvailableProductList(
            width: width,
            height: height,
          )
        ],
      ),
    );
  }
}
