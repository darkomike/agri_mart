
import 'package:block_agri_mart/domain/home/components/product_card.dart';
import 'package:flutter/material.dart';

class TrendingProducts extends StatelessWidget {
  const TrendingProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trending Products',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          key: UniqueKey(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              ProductCard(),
              ProductCard(),
              ProductCard(),
            ],
          ),
        )
      ],
    );
  }
}
