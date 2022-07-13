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
  final TextEditingController _itemQuantityController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _itemQuantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.transparent,
      extendBody: true,

      drawer: const AppDrawer(),

      body: SafeArea(
          child: CartBody(
        itemQuantityController: _itemQuantityController,
        size: size,
      )),
    );
  }

  Future<dynamic> _showPaymentDialog(BuildContext context) =>
      showDialog(context: context, builder: (context) => Dialog());
}

class CartBody extends StatelessWidget {
  const CartBody(
      {Key? key, required this.size, required this.itemQuantityController})
      : super(key: key);

  final Size size;
  final TextEditingController itemQuantityController;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(
              height: size.height / 2 - 30,
              child: PageView(
                allowImplicitScrolling: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(AssetsConstant.oranges))),
                    child: Stack(children: [
                      Positioned(
                          right: 5,
                          top: 5,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white.withOpacity(0.65)),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.remove)),
                          ))
                    ]),
                  ), Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(AssetsConstant.cucumber))),
                    child: Stack(children: [
                      Positioned(
                          right: 5,
                          top: 5,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white.withOpacity(0.65)),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.remove)),
                          ))
                    ]),
                  ), Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(AssetsConstant.pepper))),
                    child: Stack(children: [
                      Positioned(
                          right: 5,
                          top: 5,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white.withOpacity(0.65)),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.remove)),
                          ))
                    ]),
                  ), Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(AssetsConstant.banana))),
                    child: Stack(children: [
                      Positioned(
                          right: 5,
                          top: 5,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white.withOpacity(0.65)),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.remove)),
                          ))
                    ]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            height: size.height / 2 - 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Quantity : ',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        MaterialButton(
                          color: ColorConstants.greenPantone,
                          minWidth: 20,
                          height: 30,
                          onPressed: () {},
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        MaterialButton(
                          minWidth: 20,
                          height: 30,
                          child: Text(
                            "1",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(fontSize: 18),
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        MaterialButton(
                          color: Colors.redAccent,
                          minWidth: 20,
                          height: 30,
                          onPressed: () {},
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Price : ',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '23.45 ETH ',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.red),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Discount : ',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '067.3 %',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.red),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                const Divider(
                  thickness: 3,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Total Cost: ',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '34.34 ETH',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.red),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                const Spacer(),
                MaterialButton(
                    height: 50,
                    color: ColorConstants.someRockGreen,
                    minWidth: size.width - 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.payment_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Make Payment",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FloatBottomButtoms extends StatelessWidget {
  const FloatBottomButtoms(
      {Key? key, required this.size, required this.onPayment})
      : super(key: key);
  final Size size;
  final void Function()? onPayment;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: size.height / 6,
      child: Column(
        children: [
          FloatingActionButton(
              heroTag: 'payment',
              elevation: 10,
              backgroundColor: ColorConstants.someRockGreen,
              shape: RoundedRectangleBorder(
                  side:
                      BorderSide(color: ColorConstants.greenPantone, width: 2),
                  borderRadius: BorderRadius.circular(30)),
              child: const Icon(
                Icons.payment,
                color: Colors.white,
                size: 30,
              ),
              onPressed: onPayment),
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
                width: size.width / 4,
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
    );
  }
}
