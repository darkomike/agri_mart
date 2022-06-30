import 'package:flutter/material.dart';

import '../../components/widgets/custom_app_drawer.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            drawer: const AppDrawer(),

      body: Center(
        child: Text(
          "Orders",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
