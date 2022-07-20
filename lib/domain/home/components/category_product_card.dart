import 'package:flutter/material.dart';

class CategoryProductCard extends StatelessWidget {
  const CategoryProductCard({
    required this.itemSellerImageUrl,
    required this.itemImageUrl,
    required this.height,
    required this.width,
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
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedDetails,
      child: Container(
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(colors: [
              Color(0xFF02AAB0),
              Color(0xFF00CDAC),
            ])),
        child: Stack(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(itemImageUrl)),
              ),
            ),
            Positioned(
              left: 4,
              top: 4,
              child: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(itemSellerImageUrl),
              ),
            ),
            Positioned(
              left: 110,
              bottom: 10,
              child: Text(
                itemTitle,
                style: const TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
              bottom: 35,
              left: 110,
              child: Material(
                borderRadius: BorderRadius.circular(5),
                elevation: 2,
                color: const Color(0xFFF5F0EA).withOpacity(0.75),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 10, top: 5, right: 5, bottom: 5),
                  child: Text(
                    "$itemPrice ETH",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.red.shade400,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                height: 40,
                width: 40, 
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F0EA).withOpacity(0.75),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topRight: Radius.circular(10)),
                ),
                  
                  child: IconButton(
                      iconSize: 16,
                      onPressed: onPressedAddCart,
                      icon: const Icon(
                        Icons.add_shopping_cart_outlined,
                        size: 16,
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
