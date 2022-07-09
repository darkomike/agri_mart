import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/constants/assets_constant.dart';
import '../../components/theme/color_constant.dart';
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
            'Orders',
            style:
            Theme.of(context).textTheme.headline2!.copyWith(fontSize: 22),
          )
      ),

      body: Center(
        child: Text(
          "Orders",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
