
import 'package:block_agri_mart/domain/home/components/top_seller_card.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class TopSellers extends StatelessWidget {
  const TopSellers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Sellers',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: const [
              TopSellersCard(),
              TopSellersCard(),
              TopSellersCard(),
              TopSellersCard(),
            ],
          ),
        ),
      ],
    );
  }
}