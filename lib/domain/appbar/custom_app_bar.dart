import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../components/constants/assets_constant.dart';
import '../../components/theme/color_constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.scaffoldKey,
    required this.showCart, 
    required this.title,
    required this.showNotification,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool showCart;
  final bool showNotification;
  final String title;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        leading: SizedBox(
          height: 40,
          width: 40,
          child: IconButton(
            tooltip: "Open Drawer",
            icon: const Icon(Icons.menu),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              showNotification
                  ? SizedBox(
                      height: 40,
                      child: Stack(
                        children: [
                          IconButton(
                            tooltip: "Open Notification",
                            icon: const Icon(Icons.notifications),
                            onPressed: () {
                              //TODO: GO to notifications
                              context.goNamed('notifications');
                            },
                          ),
                          Positioned(
                            left: 2,
                            top: 2,
                            child: Container(
                                // height: 15,
                                //   width: 15,
                                padding:
                                    const EdgeInsets.only(left: 4, right: 4),
                                decoration: BoxDecoration(
                                    color: ColorConstants.someRockGreen,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Text(
                                  "54",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )),
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
              showCart
                  ? SizedBox(
                      height: 40,
                      child: Stack(
                        children: [
                          IconButton(
                            tooltip: "Open Cart",
                            icon: const Icon(Icons.shopping_cart),
                            onPressed: () {
                              //TODO: GO to carts...
                              context.goNamed('cart');
                            },
                          ),
                          Positioned(
                            left: 2,
                            top: 2,
                            child: Container(
                                // height: 15,
                                //   width: 15,
                                padding:
                                    const EdgeInsets.only(left: 4, right: 4),
                                decoration: BoxDecoration(
                                    color: ColorConstants.someRockGreen,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Text(
                                  "54",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )),
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
              GestureDetector(
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
              )
            ],
          )
        ],
        title: Text(
          '$title',
          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 22),
        ));
  }
}
