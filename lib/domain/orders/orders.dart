import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/constants/assets_constant.dart';
import '../../components/theme/color_constant.dart';
import '../appbar/custom_app_bar.dart';
import '../drawer/drawer.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
            drawer: const AppDrawer(),
                 appBar: CustomAppBar(scaffoldKey: _scaffoldKey, showCart: true, showNotification: true, title: 'Orders', showProfilePic: true,onTransparentBackground: false),


      body: Center(
        child: Text(
          "Orders",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
