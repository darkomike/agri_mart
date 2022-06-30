import 'package:flutter/material.dart';

import '../../components/widgets/custom_app_drawer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            drawer: const AppDrawer(),

      body: Center(
        child: Text(
          "Cart",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
