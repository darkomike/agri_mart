import 'package:block_agri_mart/components/constants/assets_constant.dart';
import 'package:block_agri_mart/components/theme/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../drawer/drawer.dart';
import 'components/categories.dart';
import 'components/top_sellers.dart';
import 'components/trending_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context).size;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: AppBar(
        // scrolledUnderElevation: 5,
        elevation: 0.0,
        leading: SizedBox(
          height: 40,
          width: 40,
          child: IconButton(
            tooltip: "Open Drawer",
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
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
                          padding: const  EdgeInsets.only(left: 4, right: 4),
                          decoration: BoxDecoration(
                            color: ColorConstants.someRockGreen,
                            borderRadius: BorderRadius.circular(20)

                          ),
                          child: const Text(
                            "54",
                            style: TextStyle(
                              color: Colors.white,fontSize: 12, fontWeight: FontWeight.w400
                            ),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
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
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          decoration: BoxDecoration(
                            color: ColorConstants.someRockGreen,
                            borderRadius: BorderRadius.circular(20)

                          ),
                          child: const Text(
                            "54",
                            style: TextStyle(
                              color: Colors.white,fontSize: 12, fontWeight: FontWeight.w400
                            ),
                          )),
                    )
                  ],
                ),
              ),
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
        // title: const Text('Notifications')
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        // key: UniqueKey(),
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Container(
          
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopSellers(),
                const SizedBox(
                  height: 15,
                ),
                const TrendingProducts(),
                const SizedBox(
                  height: 15,
                ),
                Categories(
                  width: data.width,
                  height: data.height,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
