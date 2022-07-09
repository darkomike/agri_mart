import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/constants/assets_constant.dart';
import 'category_product_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;
  // final String categoryType;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      height: height - 200,
      child: GridView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 10, right: 10, top: 10),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
        ),
        children: [
          CategoryProductCard(
            itemImageUrl: AssetsConstant.banana,
            itemTitle: 'Banana',
            itemPrice: "23.45",
            itemSellerImageUrl: AssetsConstant.profilePic2,
            onPressedAddCart: () {
              print("Add to Cart");
            },
            onPressedDetails: () {
              GoRouter.of(context).goNamed('details');
              print("Go to Details Page");
            },
          ),
          CategoryProductCard(
            itemImageUrl: AssetsConstant.avocado,
            itemTitle: 'Avocado',
            itemPrice: "23.45",
            itemSellerImageUrl: AssetsConstant.profilePic2,
            onPressedAddCart: () {
              print("Add to Cart");
            },
            onPressedDetails: () {
                            GoRouter.of(context).goNamed('details');

              print("Go to Details Page");
            },
          ),
          CategoryProductCard(
            itemImageUrl: AssetsConstant.cucumber,
            itemTitle: 'Cucumber',
            itemPrice: "23.45",
            itemSellerImageUrl: AssetsConstant.profilePic2,
            onPressedAddCart: () {
              print("Add to Cart");
            },
            onPressedDetails: () {
                            GoRouter.of(context).goNamed('details');

              print("Go to Details Page");
            },
          ),
          CategoryProductCard(
            itemImageUrl: AssetsConstant.pepper,
            itemTitle: 'Pepper',
            itemPrice: "23.45",
            itemSellerImageUrl: AssetsConstant.profilePic1,
            onPressedAddCart: () {
              print("Add to Cart");
            },
            onPressedDetails: () {
                            GoRouter.of(context).goNamed('details');

              print("Go to Details Page");
            },
          ),
          CategoryProductCard(
            itemImageUrl: AssetsConstant.oranges,
            itemTitle: 'Oranges',
            itemPrice: "23.45",
            itemSellerImageUrl: AssetsConstant.profilePic2,
            onPressedAddCart: () {
              print("Add to Cart");
            },
            onPressedDetails: () {
                            GoRouter.of(context).goNamed('details');

              print("Go to Details Page");
            },
          ),
          CategoryProductCard(
            itemImageUrl: AssetsConstant.avocado,
            itemTitle: 'Avocado',
            itemPrice: "23.45",
            itemSellerImageUrl: AssetsConstant.profilePic2,
            onPressedAddCart: () {
              print("Add to Cart");
            },
            onPressedDetails: () {
                            GoRouter.of(context).goNamed('details');

              print("Go to Details Page");
            },
          ),
        ],
      ),
    );
  }
}
