import 'package:block_agri_mart/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/constants/assets_constant.dart';

class TrendingProductCard extends StatelessWidget {
  const TrendingProductCard(
      {Key? key,
      required this.addCart,
      required this.discount,
      required this.name,
      required this.onPressed,
      required this.price,
      required this.productThumbNail,
      required this.sellerThumbNail})
      : super(key: key);

  final String name;
  final String productThumbNail;
  final String sellerThumbNail;
  final double price;
  final double discount;
  final void Function()? addCart;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
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
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(productThumbNail)),
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
                      backgroundImage: AssetImage(sellerThumbNail),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      name,
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                 const SizedBox(
                  height: 5,
                ),
              ],
            ),
            Positioned(
              bottom: 55,
              left: 15, 
              child: Material(
                elevation: 10,
                shadowColor: Colors.green,
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFFF5F0EA).withOpacity(0.70),
                child: SizedBox(
                  height: 60,
                  width: 170,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Price",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "$price ETH",
                            style: const TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Discount",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "$discount %",
                            style: const TextStyle(fontSize: 12),overflow: TextOverflow.ellipsis
                          ),
                        ],
                      ),
                    ],
                  ),
                ),      
              ),
            ),
          context.watch<AppStateManager>().userType.toLowerCase() == 'buyer' ?   Positioned(
              right: 0,
              child: Material(
                  color: const Color(0xFFF5F0EA).withOpacity(0.65),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  child: IconButton(
                      onPressed: addCart,
                      icon: const Icon(Icons.add_shopping_cart_outlined))),
            ): const SizedBox()
          ],
        ),
      ),
    );
  }
}
