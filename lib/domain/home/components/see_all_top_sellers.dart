import 'package:block_agri_mart/domain/domain.dart';
import 'package:flutter/material.dart';

class SeeAllTopSellerPage extends StatefulWidget {
  SeeAllTopSellerPage({Key? key}) : super(key: key);

  @override
  State<SeeAllTopSellerPage> createState() => _SeeAllTopSellerPageState();
}

class _SeeAllTopSellerPageState extends State<SeeAllTopSellerPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          showCart: true,
          showProfilePic: true,
          title: 'Top Sellers',
          isHome: false,
          showNotification: true,
          onTransparentBackground: false),

          
    );
  }
}
