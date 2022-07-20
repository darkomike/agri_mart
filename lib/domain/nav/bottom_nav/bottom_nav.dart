import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../../components/components.dart';
import 'components/bottom_nav_item.dart';

class CustomBottomNavigatorBar extends StatefulWidget {
  final ScrollController controller;
  final Duration duration;

  const CustomBottomNavigatorBar({
    this.duration = const Duration(milliseconds: 100),
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomNavigatorBar> createState() =>
      _CustomBottomNavigatorBarState();
}

class _CustomBottomNavigatorBarState extends State<CustomBottomNavigatorBar> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listen);
  }

  listen() {
    final direction = widget.controller.position.userScrollDirection;

    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
    // if (widget.controller.position.pixels >= 200){
    //   hide();
    // }else {
    //   show();
    // }
  }

  show() {
    if (!isVisible) {
      setState(() => isVisible = true);
    }
  }

  hide() {
    if (isVisible) {
      setState(() => isVisible = false);
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      
      duration: widget.duration,
      height: isVisible ? 80 : 0,

      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Wrap(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomBottomNavigationItem(
                  onTap: () {
                    context
                        .read<AppStateManager>()
                        .changeNavigationBottomSelected('home');
                  },
                  icon: Icons.home,
                  label: 'Home',
                  isSelected: 'home',
                ),
               
                CustomBottomNavigationItem(
                  onTap: () {
                    context
                        .read<AppStateManager>()
                        .changeNavigationBottomSelected('recommends');
                  },
                  icon: Icons.record_voice_over_rounded,
                  label: 'Recommends',
                  isSelected: 'recommends',
                ),
                 CustomBottomNavigationItem(
                  onTap: () {
                    context
                        .read<AppStateManager>()
                        .changeNavigationBottomSelected('requests');
                  },
                  icon: Icons.receipt_sharp,
                  label: 'Requests',
                  isSelected: 'requests',
                ),
              
                CustomBottomNavigationItem(
                  onTap: () {
                    context
                        .read<AppStateManager>()
                        .changeNavigationBottomSelected('transactions');
                  },
                  icon: Icons.transfer_within_a_station_sharp,
                  label: 'Transactions',
                  isSelected: 'transactions',
                ),

                  CustomBottomNavigationItem(
                  onTap: () {
                    context
                        .read<AppStateManager>()
                        .changeNavigationBottomSelected('wallet');
                  },
                  icon: Icons.category,
                  label: 'Wallet',
                  isSelected: 'wallet',
                ),
              ],
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: ColorConstants.primaryColor.withOpacity(0.2),
      ),
    );
  }
}
