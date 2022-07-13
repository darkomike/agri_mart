
import 'package:block_agri_mart/domain/products/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../nav/appbar/custom_app_bar.dart';
import '../drawer/drawer.dart';
import 'package:go_router/go_router.dart';

export './provider/product_provider.dart';
export './components/components.dart';


class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
                  appBar: CustomAppBar(
                                  isHome: false,

                    scaffoldKey: _scaffoldKey, showCart: false, showNotification: false, title: 'Products', showProfilePic: true,onTransparentBackground: false),

      floatingActionButton:  context.watch<ProductStateManager>().totalProducts == 0 ? const SizedBox(): FloatingActionButton(
          onPressed: () {
            context.goNamed('add_product');
          },
          child: const Icon(Icons.add)),
      body: Provider.of<ProductStateManager>(context).totalProducts == 0
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    type: MaterialType.card,
                    elevation: 2,
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: data.size.width - 120,
                      color: Colors.green,
                      child: const Text("Illustration Picture Here"),
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
                  MaterialButton(
                    color: Colors.white,
                    height: 45,
                    minWidth: data.size.width - 120,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.5, color: Colors.green.shade400),
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      //TODO: Add Product
                      context.goNamed('add_product');

                    },
                    child: const Text("Add Product"),
                  )
                ],
              ),
            )
          : ListView(
              children: [
                MaterialButton(
                  onPressed: () {},
                )
              ],
            ),
    );
  }
}
