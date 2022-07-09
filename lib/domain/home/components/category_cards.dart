import 'package:block_agri_mart/domain/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_selection_card.dart';

class CategoryCards extends StatelessWidget {
  const CategoryCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CategorySelectionCard(
          onPressed: () {
            Provider.of<HomeStateManager>(context, listen: false)
                .updateCategoryCard("All");
          },
          title: 'All',
        ),
        const SizedBox(
          width: 4,
        ),
        CategorySelectionCard(
          onPressed: () {
            Provider.of<HomeStateManager>(context, listen: false)
                .updateCategoryCard("Fruits");
          },
          title: 'Fruits',
        ),
        const SizedBox(
          width: 4,
        ),
        CategorySelectionCard(
          onPressed: () {
            Provider.of<HomeStateManager>(context, listen: false)
                .updateCategoryCard("Vegetables");
          },
          title: 'Vegetables',
        ),
        const SizedBox(
          width: 4,
        ),
        CategorySelectionCard(
          onPressed: () {
            Provider.of<HomeStateManager>(context, listen: false)
                .updateCategoryCard("Cereals");
          },
          title: 'Cereals',
        ),
        const SizedBox(
          width: 4,
        ),
        CategorySelectionCard(
          onPressed: () {
            Provider.of<HomeStateManager>(context, listen: false)
                .updateCategoryCard("Poultry");
          },
          title: 'Poultry',
        ),
        const SizedBox(
          width: 4,
        ),
      ],
    );
  }
}
