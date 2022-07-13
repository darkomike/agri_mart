import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'components/app_bar_icon_button.dart';
import 'components/profile_icon.dart';



class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.scaffoldKey,
      required this.showCart,
      required this.showProfilePic,
     this.showDrawer,
      required this.title,
      required this.showNotification,
      required this.onTransparentBackground})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool showCart;
  final bool showNotification;
  final bool showProfilePic;
  final bool? showDrawer;
  final bool onTransparentBackground;

  final String title;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        
       leading : showProfilePic ?   Container(
         margin:  const EdgeInsets.only(left: 10),
         child:   const ProfileIcon(),
       ) : const SizedBox(),
        backgroundColor:  onTransparentBackground ?  Colors.transparent : Theme.of(context).backgroundColor,
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
            
            ],
          )
        ],
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 22),
        ));
  }
} 

