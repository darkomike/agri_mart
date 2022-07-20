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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
      appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,                            
          showCart: true,
          showProfilePic: true,
          title: 'Cart',
          isHome: false,
          showNotification: true,
          onTransparentBackground: false),

      body: SafeArea(
          child: CartBody(
        itemQuantityController: _itemQuantityController,
        size: size,
      )),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 100,
        color: Colors.red,
        child: Row(),
      ),
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
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    child:  ListView.separated(
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            
            height: 150,
            decoration: BoxDecoration(
              color: ColorConstants.primaryColor.withOpacity(.15)
            ),
           child: Row(children: [
            
           ],)
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 5,
            
          );
        },
      ),
     
    );
  }
}






// class FloatBottomButtoms extends StatelessWidget {
//   const FloatBottomButtoms(
//       {Key? key, required this.size, required this.onPayment})
//       : super(key: key);
//   final Size size;
//   final void Function()? onPayment;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.transparent,
//       height: size.height / 6,
//       child: Column(
//         children: [
//           FloatingActionButton(
//               heroTag: 'payment',
//               elevation: 10,
//               backgroundColor: ColorConstants.primaryColor,
//               shape: RoundedRectangleBorder(
//                   side:
//                       BorderSide(color: ColorConstants.primaryColor, width: 2),
//                   borderRadius: BorderRadius.circular(30)),
//               child: const Icon(
//                 Icons.payment,
//                 color: Colors.white,
//                 size: 30,
//               ),
//               onPressed: onPayment),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               FloatingActionButton(
//                   heroTag: 'home',
//                   elevation: 10,
//                   backgroundColor: ColorConstants.primaryColor,
//                   shape: RoundedRectangleBorder(
//                       side: BorderSide(
//                           color: ColorConstants.primaryColor, width: 2),
//                       borderRadius: BorderRadius.circular(30)),
//                   child: const Icon(
//                     Icons.home,
//                     color: Colors.white,
//                     size: 30,
//                   ),
//                   onPressed: () {
//                     //TODO: Go to home...
//                     context.goNamed('home');
//                   }),
//               SizedBox(
//                 width: size.width / 4,
//               ),
//               FloatingActionButton(
//                   heroTag: 'profile',
//                   elevation: 10,
//                   backgroundColor: ColorConstants.primaryColor,
//                   shape: RoundedRectangleBorder(
//                       side: BorderSide(
//                           color: ColorConstants.primaryColor, width: 2),
//                       borderRadius: BorderRadius.circular(30)),
//                   child: const Icon(
//                     Icons.account_circle_outlined,
//                     color: Colors.white,
//                     size: 30,
//                   ),
//                   onPressed: () {
//                     ///Go to profile
//                     context.goNamed('profile');
//                   }),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
