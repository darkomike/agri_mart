import 'package:block_agri_mart/components/components.dart';
import 'package:block_agri_mart/domain/home/components/top_seller_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Sellers',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: TextButton(
                  onPressed: () {
                    context.goNamed('sellers');
                  },
                  child: const Text("See all")),
            )
          ],
        ),
        SizedBox(
          height: 160,
          child: ListView.separated(
            key: UniqueKey(),
            itemCount: 4,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(
              width: 5,
            ),
            itemBuilder: (context, index) => TopSellersCard(
                buyersCount: 234,
                imageThumbnail: AssetsConstant.profilePic,
                onPressed: () {},
                name: '0x34568797563456...',
                productCount: 345,
                rating: 3.4,
                salesCount: 120),
            physics: const BouncingScrollPhysics(),
          ),
        ),
      ],
    );
  }
}
