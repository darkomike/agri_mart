import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/constants/assets_constant.dart';
import '../../components/theme/color_constant.dart';
import '../appbar/custom_app_bar.dart';
import '../drawer/drawer.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      key: _scaffoldKey,
      appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          showCart: true,
          showNotification: false,
          title: 'Transactions',
          showProfilePic: true,
          onTransparentBackground: false),
      body: Center(
        child: Text(
          "Transactions",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
