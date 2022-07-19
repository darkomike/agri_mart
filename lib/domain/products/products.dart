import 'package:block_agri_mart/components/theme/theme.dart';
import 'package:block_agri_mart/domain/products/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
export './provider/product_provider.dart';
export './components/components.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      child: Provider.of<ProductStateManager>(context).totalProducts == 0
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Material(
                    type: MaterialType.card,
                    elevation: 2,
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: data.size.width - 120,
                      color: ColorConstants.primaryColor,
                      child: const Text("Illustration Picture Here"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "No products available",
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          : ListView(
            shrinkWrap: true,
              children: [
                ListTile(
                  
                ),
                MaterialButton(
                  onPressed: () {},
                  
                )
              ],
            ),
    );
  }
}
