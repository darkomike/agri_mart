import 'package:block_agri_mart/components/constants/assets_constant.dart';
import 'package:block_agri_mart/components/theme/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../appbar/custom_app_bar.dart';
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
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey, showCart: true, showNotification: true, title: '',),
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
