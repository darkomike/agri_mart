import 'package:block_agri_mart/components/components.dart';
import 'package:block_agri_mart/domain/domain.dart';
import 'package:block_agri_mart/domain/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../components/utils/utils.dart';
import '../domain.dart';
import '../nav/bottom_nav/bottom_nav.dart';
import '../requests/requests.dart';
import '../transactions/transactions.dart';

export './provider/home_provider.dart';
export './components/components.dart';
export './models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final availableProductKey = GlobalKey();

  var availableProductContext;

  int _selectedItem = 0;
  late ScrollController _mainScrollController;
  late ScrollController _categoryScrollController;
  @override
  void initState() {
    _mainScrollController = ScrollController();
    _categoryScrollController = ScrollController();

   
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// here you can see we are assigning globalKey.currentContext to the targetContext
      /// variable which help to render the exact  widget which we are targeting.
      availableProductContext = availableProductKey.currentContext;

      setState(() {});
    });

    super.initState();
  }

  // @override
  // void dispose() {
  //   _mainScrollController.dispose();
  //   _categoryScrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        key: _scaffoldKey,
        floatingActionButton: Container(
          // color: Colors.red,
          height: context.watch<AppStateManager>().userType.toLowerCase() ==
                  'seller'
              ? 120
              : 68,
          child: context.watch<HomeStateManager>().mainScrollPositionPixel > 400
              ? FloatingActionButton(
                  heroTag: 'go_to',
                  backgroundColor: ColorConstants.primaryColor,
                  child: const Center(
                    child: RotatedBox(
                        quarterTurns: 1, child: Icon(Icons.arrow_back_ios)),
                  ),
                  onPressed: () {
                    _mainScrollController.animateTo(0.0,
                        duration: const Duration(microseconds: 600),
                        curve: Curves.ease);
                    // setState(() {

                    //   if (availableProductContext != null) {
                    //     Scrollable.ensureVisible(availableProductContext,
                    //         alignment: 0,
                    //         curve: Curves.ease,
                    //         duration: const Duration(milliseconds: 800));
                    //   }
                    // });
                  },
                )
              : const SizedBox(),
        ),
        appBar: CustomAppBar(
          isHome: true,
          scaffoldKey: _scaffoldKey,
          showCart: true,
          showNotification: true,
          title: context.watch<AppStateManager>().navigationBottomSelected ==
                  'home'
              ? 'AgriMart'
              : capitalize(
                  value: context
                      .watch<AppStateManager>()
                      .navigationBottomSelected),
          showProfilePic: true,
          onTransparentBackground: false,
        ),
        bottomNavigationBar:
            CustomBottomNavigatorBar(controller: _mainScrollController),
        body: SafeArea(
          child: ListView(
              physics: const ClampingScrollPhysics(),
              controller: _mainScrollController,
              children: [
                _bottomNavigation(
                    selectedPage: context
                        .watch<AppStateManager>()
                        .navigationBottomSelected,
                    size: size),
              ]),
        ));
  }

  Widget _bottomNavigation({required String selectedPage, required Size size}) {
    switch (selectedPage) {
      case "home":
        return Home(
          availableProductKey: availableProductKey,
          controller: _categoryScrollController,
          size: size,
        );
      case "requests":
        return const RequestsScreen();
      case "recommends":
        return const RecommendsScreen();
      case "transactions":
        return const TransactionsScreen();
      case "products":
        return const ProductsScreen();
      case "wallet":
        return WalletScreen(size: size);

      default:
        return Home(
            availableProductKey: availableProductKey,
            controller: _categoryScrollController,
            size: size);
    }
  }
}

class Home extends StatelessWidget {
  const Home(
      {Key? key,
      required this.size,
      required this.controller,
      required this.availableProductKey})
      : super(key: key);

  final Size size;
  final ScrollController controller;
  final GlobalKey availableProductKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopSellers(),
          const SizedBox(
            height: 10,
          ),
          const TrendingProducts(),
          const SizedBox(
            height: 10,
          ),
          Categories(
            availableProductKey: availableProductKey,
            width: size.width,
            height: size.height,
          )
        ],
      ),
    );
  }
}
