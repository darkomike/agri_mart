import 'package:block_agri_mart/components/components.dart';
import 'package:block_agri_mart/domain/home/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TrendingProducts extends StatelessWidget {
  const TrendingProducts({
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
              'Trending Products',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(
                    
                    fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: TextButton(
                onPressed: () {  
                                    context.goNamed('trending_products');

              }, child: const Text("See all")),
            )
          ],
        ),
      
        SizedBox(
          height: 200,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            key: UniqueKey(),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context,index)=> const SizedBox(width: 5,),
            itemBuilder: (context,index)=>  TrendingProductCard(
                    addCart: () {},
                    discount: 2.3,
                    name: 'Oranges',
                    onPressed: () {},
                    price: 23.45,
                    productThumbNail: AssetsConstant.oranges,
                    sellerThumbNail: AssetsConstant.profilePic),
            itemCount: 4,
          ),
        )
      ],
    );
  }
}
