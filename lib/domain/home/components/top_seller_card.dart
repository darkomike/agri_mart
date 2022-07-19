import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../components/constants/assets_constant.dart';

class TopSellersCard extends StatelessWidget {
  const TopSellersCard({
    required this.buyersCount,
    required this.imageThumbnail,
    required this.onPressed,
    required this.name,
    required this.productCount,
    required this.rating,
    required this.salesCount,
    Key? key,
  }) : super(key: key);

  final String name;
  final double rating;
  final int productCount;
  final int salesCount;
  final int buyersCount;
  final String imageThumbnail;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 10,
      onPressed: onPressed,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(colors: [
              Color(0xFF02AAB0),
              Color(0xFF00CDAC),
            ])),
        child: Stack(
          children: [
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SellerBanner(),
                  const SizedBox(
                    height: 3,
                  ),
                  SellerName(name: name),
                  SellerRatings(
                    ratings: rating,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  ProductSoldBuyersWidget(
                      productCount: productCount,
                      salesCount: salesCount,
                      buyersCount: buyersCount)
                ],
              ),
            ),
            const SellerImage()
          ],
        ),
      ),
    );
  }
}

class SellerBanner extends StatelessWidget {
  const SellerBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 190,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage(AssetsConstant.bgPic)),
      ),
    );
  }
}

class SellerImage extends StatelessWidget {
  const SellerImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 65,
      left: 5,
      child: CircleAvatar(
        radius: 15,
        backgroundImage: AssetImage(AssetsConstant.profilePic2),
      ),
    );
  }
}

class SellerRatings extends StatelessWidget {
  const SellerRatings({Key? key, required this.ratings}) : super(key: key);

  final double ratings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: RatingBarIndicator(
        rating: ratings,
        itemCount: 5,
        itemSize: 10.0,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
      ),
    );
  }
}

class SellerName extends StatelessWidget {
  const SellerName({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Text(name),
    );
  }
}

class ProductSoldBuyersWidget extends StatelessWidget {
  const ProductSoldBuyersWidget({
    Key? key,
    required this.productCount,
    required this.salesCount,
    required this.buyersCount,
  }) : super(key: key);

  final int productCount;
  final int salesCount;
  final int buyersCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
      width: 170,
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.85), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Products",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                ),
                Text(
                  "$productCount",
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sold",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                ),
                Text(
                  "$salesCount",
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Buyers",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                ),
                Text(
                  "$buyersCount",
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
