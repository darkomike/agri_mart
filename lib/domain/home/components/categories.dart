import 'package:flutter/material.dart';

import 'category_cards.dart';
import 'category_list.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(fontWeight: FontWeight.w600),
          ),

          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics:  BouncingScrollPhysics(),
            child: CategoryCards(),
          ),
          CategoryList(
            width: width,
            height: height,
          )
        ],
      ),
    );
  }
}
