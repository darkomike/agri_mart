import 'package:block_agri_mart/components/theme/color_constant.dart';
import 'package:block_agri_mart/domain/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategorySelectionCard extends StatelessWidget {
  const CategorySelectionCard({
    required this.onPressed,
    required this.title,
    Key? key,
  }) : super(key: key);

  // final String isSelected;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      animationDuration: const Duration(milliseconds: 200),
      height: 40,
      elevation: title ==
                      Provider.of<HomeStateManager>(context)
                          .categorySelectedCard ? 2: 1,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: title ==
                      Provider.of<HomeStateManager>(context)
                          .categorySelectedCard
                  ? ColorConstants.someRockGreen
                  : const Color(0xFFF1F6F2)),
          borderRadius: BorderRadius.circular(5)),
      color:
          title == Provider.of<HomeStateManager>(context).categorySelectedCard
              ? ColorConstants.someRockGreen
              : const Color(0xFFF1F6F2),
      disabledColor: Colors.transparent,
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            color: title ==
                    Provider.of<HomeStateManager>(context).categorySelectedCard
                ? Colors.white
                : Colors.black),
      ),
    );
  }
}
