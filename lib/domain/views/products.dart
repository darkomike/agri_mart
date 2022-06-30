import 'package:flutter/material.dart';

import '../../components/widgets/custom_app_drawer.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            drawer: const AppDrawer(),

      body: Center(
        child: Text(
          "Products",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
