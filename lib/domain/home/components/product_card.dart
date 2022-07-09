
import 'package:flutter/material.dart';

import '../../../components/constants/assets_constant.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Container(
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: const LinearGradient(
                colors: [
              Color(0xFF02AAB0),
              Color(0xFF00CDAC),
            ])),
        height: 190,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AssetsConstant.oranges)),
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
                      backgroundImage: AssetImage(AssetsConstant.profilePic1),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text(
                      "Avocado Pear",
                      style: TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Material(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFFF5F0EA).withOpacity(0.65),
                child: SizedBox(
                  height: 60,
                  width: 170,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Price",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "23.45 ETH",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Discount",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "5.4 %",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Material(
                  color: const Color(0xFFF5F0EA).withOpacity(0.65),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  child: IconButton(
                      onPressed: () {
                        //TODO: Add to cart
                      },
                      icon: const Icon(Icons.add_shopping_cart_outlined))),
            )
          ],
        ),
      ),
    );
  }
}

