import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/constants/assets_constant.dart';
import 'category_product_card.dart';

class AvailableProductList extends StatelessWidget {
  const AvailableProductList({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;
  // final String categoryType;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
      itemBuilder: (context, index) {
        return CategoryProductCard(
          width: width,
          height: height,
          itemImageUrl: AssetsConstant.pepper,
          itemTitle: 'Pepper',
          itemPrice: "23.45",
          itemSellerImageUrl: AssetsConstant.profilePic2,
          onPressedAddCart: () {
            print("Add to Cart");
          },
          onPressedDetails: () {
            GoRouter.of(context).goNamed('details');
            print("Go to Details Page");
          },
        );
      },
      shrinkWrap: true,
      // padding: const EdgeInsets.only(bottom: 10, right: 10, top: 10),
      physics: const BouncingScrollPhysics(),
    );
  }
}
