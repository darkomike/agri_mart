import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../components/components.dart';
import '../domain.dart';


export './provider/cart_provider.dart';

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
      bottomNavigationBar: SizedBox(
        height: data.size.height / 6,
        child: Column(
          children: [
            FloatingActionButton(
              heroTag: 'payment',
                elevation: 10,
                backgroundColor: ColorConstants.someRockGreen,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: ColorConstants.greenPantone, width: 2),
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.payment,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  //TODO: Make Payment func...
                  _showPaymentDialog(context);
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
heroTag: 'home',
                    elevation: 10,
                    backgroundColor: ColorConstants.someRockGreen,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: ColorConstants.greenPantone, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      //TODO: Go to home...
                      context.goNamed('home');
                    }),
                SizedBox(
                  width: data.size.width / 4,
                ),
                FloatingActionButton(
                  heroTag: 'profile',
                    elevation: 10,
                    backgroundColor: ColorConstants.someRockGreen,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: ColorConstants.greenPantone, width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      ///Go to profile
                      context.goNamed('profile');

                    }),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
      child: Center(
          child: Text(
            "Cart",
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showPaymentDialog(BuildContext context) => showDialog(context: context, builder: (context)=> Dialog());
}



class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}