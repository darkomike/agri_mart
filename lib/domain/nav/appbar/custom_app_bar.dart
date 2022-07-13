import 'package:block_agri_mart/components/components.dart';
import 'package:block_agri_mart/components/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'components/app_bar_icon_button.dart';
import 'components/profile_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.scaffoldKey,
      required this.showCart,
      required this.showProfilePic,
      this.showDrawer,
      required this.title, required this.isHome,
      required this.showNotification,
      required this.onTransparentBackground})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool showCart;
  final bool showNotification;
  final bool showProfilePic;
  final bool? showDrawer;
  final bool isHome;
  final bool onTransparentBackground;

  final String title;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        leading: showProfilePic
            ? Container(
                margin: const EdgeInsets.only(left: 10),
                child: const ProfileIcon(),
              )
            : const SizedBox(),
        backgroundColor: onTransparentBackground
            ? Colors.transparent
            : Theme.of(context).backgroundColor,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              showNotification
                  ? AppBarIconButton(
                      showBgColor: onTransparentBackground,
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
                      showBgColor: onTransparentBackground,
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

                    AppBarIconButton(
                      showBgColor: onTransparentBackground,
                      onPressed: () {
                        
                        context.read<AppStateManager>().setIsLoggedIn(false);
                      },
                      icon: const Icon(Icons.exit_to_app),
                      showCount: false,
                      count: 0,
                    )
            ],
          )
        ],
        title: title.toLowerCase() == 'agrimart' ? 
        Row(children: [
           Text(
          title,
          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 18),
        ),  
        SizedBox(width: 3,),
         LottieBuilder.asset(
        AssetsConstant.homepageLottie,
        width: 20,
        height: 20,
      ),
        
        ],):
        
         Text(
          title,
          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 18),
        ));
  }
}
