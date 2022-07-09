import 'package:flutter/material.dart';

class CategoryProductCard extends StatelessWidget {
  const CategoryProductCard({
    required this.itemSellerImageUrl,
    required this.itemImageUrl,
    required this.onPressedDetails,
    required this.onPressedAddCart,
    required this.itemPrice,
    required this.itemTitle,
    Key? key,
  }) : super(key: key);

  final void Function()? onPressedDetails;
  final void Function()? onPressedAddCart;
  final String itemImageUrl;
  final String itemSellerImageUrl;
  final String itemPrice;
  final String itemTitle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.only(bottom: 10),
      onPressed: onPressedDetails,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: const LinearGradient(colors: [
              Color(0xFF02AAB0),
              Color(0xFF00CDAC),
            ])),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(itemImageUrl)),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(

                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(itemSellerImageUrl),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      itemTitle,
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  
                ),
              ],

            ),
            Positioned(
              left: 4,
              bottom: 45,
              child: Material(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFFF5F0EA).withOpacity(0.75),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 10, top: 5, right: 5, bottom: 5),
                  child: Text(
                    "$itemPrice ETH",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Material(
                  color: const Color(0xFFF5F0EA).withOpacity(0.75),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  child: IconButton(
                      onPressed: onPressedAddCart,
                      icon: const Icon(Icons.add_shopping_cart_outlined))),
            )
          ],
        ),
      ),
    );
  }
}
