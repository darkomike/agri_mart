import 'package:flutter/material.dart';

import '../../domain.dart';

class SeeAllTrendingProductsPage extends StatefulWidget {
  SeeAllTrendingProductsPage({Key? key}) : super(key: key);

  @override
  State<SeeAllTrendingProductsPage> createState() =>
      _SeeAllTrendingProductsPageState();
}

class _SeeAllTrendingProductsPageState
    extends State<SeeAllTrendingProductsPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          showCart: true,
          showProfilePic: true,
          title: 'Trending Products',
          isHome: false,
          showNotification: true,
          onTransparentBackground: false),
    );
  }
}
