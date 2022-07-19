import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/components.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  const CustomBottomNavigationItem({
    Key? key,
    required this.onTap,
    required this.isSelected,
    required this.label,
    required this.icon,
  }) : super(key: key);

  final void Function()? onTap;
  final String isSelected;
  final String label;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  size: isSelected ==
                          context
                              .watch<AppStateManager>()
                              .navigationBottomSelected
                      ? 18
                      : 16,
                  color: isSelected ==
                          context
                              .watch<AppStateManager>()
                              .navigationBottomSelected
                      ? ColorConstants.primaryColor
                      : Theme.of(context).iconTheme.color!.withOpacity(0.5)),
              Text(label,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: 10,
                          fontWeight: context
                                  .watch<AppStateManager>()
                                  .navigationBottomSelected ==
                              isSelected
                          ? FontWeight.w500: FontWeight.normal
                          ,
                      color: context
                                  .watch<AppStateManager>()
                                  .navigationBottomSelected ==
                              isSelected
                          ? ColorConstants.primaryColor
                          : Theme.of(context)
                              .iconTheme
                              .color!
                              .withOpacity(0.5)))
            ],
          ),
        ),
      ),
    );
  }
}
