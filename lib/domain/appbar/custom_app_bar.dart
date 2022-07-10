import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../components/constants/assets_constant.dart';
import '../../components/theme/color_constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.scaffoldKey,
      required this.showCart,
      required this.showProfilePic,
      required this.title,
      required this.showNotification,
      required this.onTransparentBackground})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool showCart;
  final bool showNotification;
  final bool showProfilePic;
  final bool onTransparentBackground;

  final String title;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        leading: AppBarIconButton(
          buttonMarginT: 12,
          buttonMarginB: 5,
          buttonMarginL: 10,
          onPressed: () {
            //TODO: Open Drawer...
            scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu),
          showCount: false,
          count: 0,
        ),
        backgroundColor:  onTransparentBackground ?  Colors.transparent : Theme.of(context).backgroundColor,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              showNotification
                  ? AppBarIconButton(
                      onPressed: () {
                        //TODO: GO to notification...
                        context.goNamed('notifications');
                      },
                      icon: const Icon(Icons.notifications),
                      showCount: true,
                      count: 0,
                    )
                  : const SizedBox(),
              showCart
                  ? AppBarIconButton(
                      onPressed: () {
                        //TODO: GO to profile...
                        context.goNamed('cart');
                      },
                      icon: const Icon(Icons.shopping_cart),
                      showCount: true,
                      count: 0,
                    )
                  : const SizedBox(
                      width: 10,
                    ),
              showProfilePic
                  ? const ProfileIcon()
                  : const SizedBox(
                      width: 5,
                    )
            ],
          )
        ],
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 22),
        ));
  }
}

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: GO to profile...
        context.goNamed('profile');
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: CircleAvatar(
          backgroundImage: AssetImage(AssetsConstant.profilePic2),
        ),
      ),
    );
  }
}

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    required this.onPressed, this.buttonMarginT, this.buttonMarginL, this.buttonMarginB,
    required this.count,
    required this.icon,
    this.toolTip,
    required this.showCount,
    Key? key,
  }) : super(key: key);

  final void Function()? onPressed;
  final Widget icon;
  final String? toolTip;
  final int? count;
  final bool showCount;
  final double? buttonMarginL;
  final double? buttonMarginB;
  final double? buttonMarginT;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin:  EdgeInsets.only(right: 5, bottom: buttonMarginB ?? 0 , top: buttonMarginT ?? 0, left: buttonMarginL ?? 0),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.65),
          borderRadius: BorderRadius.circular(5)),
      height: 40,
      child: Stack(
        children: [
          IconButton(tooltip: toolTip, icon: icon, onPressed: onPressed),
          showCount
              ? Positioned(
                  left: 2,
                  top: 2,
                  child: Container(
                      // height: 15,
                      //   width: 15,
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      decoration: BoxDecoration(
                          color: ColorConstants.someRockGreen,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "$count",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
