import 'package:block_agri_mart/components/theme/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../drawer/drawer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      drawer: const AppDrawer(),
      floatingActionButton: Container(
        height: data.size.height / 7,
        // color: Colors.amber,
        child: Column(
          children: [
            MaterialButton(
              elevation: 20,
              color: ColorConstants.someRockGreen,
              minWidth: 40,
              height: 40,
              shape: RoundedRectangleBorder(
                  side:
                      BorderSide(color: ColorConstants.greenPantone, width: 2),
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                //TODO: Make payment function
              },
              child: const Icon(
                Icons.payment,
                color: Colors.white,
                size: 30,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  elevation: 10,
                  color: ColorConstants.someRockGreen,
                  minWidth: 40,
                  height: 40,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: ColorConstants.greenPantone, width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    //TODO: GO to home
                    context.goNamed('home');
                  },
                  child: const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: data.size.width / 4,
                ),
                MaterialButton(
                  elevation: 10,
                  color: ColorConstants.someRockGreen,
                  minWidth: 40,
                  height: 40,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: ColorConstants.greenPantone, width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    //TODO: Go to Profile
                    context.goNamed('profile');
                  },
                  child: const Icon(
                    Icons.account_circle_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Text(
          "Cart",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
