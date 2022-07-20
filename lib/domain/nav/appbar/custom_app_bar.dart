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
      required this.title,
      required this.isHome,
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
  Size get preferredSize =>
      Size.fromHeight(title.toLowerCase() == ('transactions') ||
              title.toLowerCase() == ('requests')
          ? 110.0
          : 60);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
            leadingWidth: 0,
            elevation: 0.0,
            leading: const SizedBox(
              height: 0,
              width: 0,
            ),
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
                      ? context
                                  .watch<AppStateManager>()
                                  .userType
                                  .toLowerCase() ==
                              "buyer"
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
                          : const SizedBox()
                      : const SizedBox(
                          width: 10,
                        ),
                  context.watch<AppStateManager>().userType.toLowerCase() == 'seller' ?      AppBarIconButton(
                              showBgColor: onTransparentBackground,
                              onPressed: () {
                                //TODO: GO to add product...
                                context.goNamed('add_product');
                              },
                              icon: const Icon(Icons.add_box),
                              showCount: false,
                              count: 0,
                            )
                          : const SizedBox(),
                  showProfilePic
                      ? Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: ProfileIcon(
                            scaffoldKey: scaffoldKey,
                          ),
                        )
                      : const SizedBox(),
                ],
              )
            ],
            title: title.toLowerCase() == 'agrimart'
                ? Row(
                    children: [
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      LottieBuilder.asset(
                        AssetsConstant.homepageLottie,
                        width: 20,
                        height: 20,
                      ),
                    ],
                  )
                : Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 18),
                  )),
        title.toLowerCase() == ('transactions') ||
                title.toLowerCase() == ('requests')
            ? Container(
                color: onTransparentBackground
                    ? Colors.transparent
                    : Theme.of(context).backgroundColor,
                height: 50,
                // color: Colors.red,
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: MaterialButton(
                          height: 40,
                          color: ColorConstants.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'Personal',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 1,
                        child: MaterialButton(
                          height: 40,
                          color: const Color(0xFFF1F6F2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'Others',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {},
                        )),
                  ],
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
