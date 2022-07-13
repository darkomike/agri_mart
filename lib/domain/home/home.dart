import 'package:block_agri_mart/components/components.dart';
import 'package:block_agri_mart/components/utils/utils.dart';
import 'package:block_agri_mart/domain/orders/orders.dart';
import 'package:block_agri_mart/domain/requests/requests.dart';
import 'package:block_agri_mart/domain/transactions/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../domain.dart';
import '../drawer/drawer.dart';
import './components/components.dart';

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
  int _selectedItem = 0;
  late ScrollController _mainScrollController;
  late ScrollController _categoryScrollController;
  @override
  void initState() {
    _mainScrollController = ScrollController();
    _categoryScrollController = ScrollController();

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
    final data = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
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
          child: SingleChildScrollView(
            controller: _mainScrollController,
            child: _bottomNavigation(
                selectedPage:
                    context.watch<AppStateManager>().navigationBottomSelected,
                data: data),
          ),
        ));
  }

  Widget _bottomNavigation({required String selectedPage, required Size data}) {
    switch (selectedPage) {
      case "dashboard":
        return Dashboard(controller: _categoryScrollController, data: data);
      case "requests":
        return const RequestsScreen();
      case "orders":
        return const OrdersScreen();
      case "transactions":
        return const TransactionsScreen();
      case "products":
        return Dashboard(controller: _categoryScrollController, data: data);

      default:
        return Dashboard(controller: _categoryScrollController, data: data);
    }
  }
}

class CustomBottomNavigatorBar extends StatefulWidget {
  final ScrollController controller;
  final Duration duration;

  const CustomBottomNavigatorBar({
    this.duration = const Duration(milliseconds: 200),
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomNavigatorBar> createState() =>
      _CustomBottomNavigatorBarState();
}

class _CustomBottomNavigatorBarState extends State<CustomBottomNavigatorBar> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listen);
  }

  listen() {
    final direction = widget.controller.position.userScrollDirection;

    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
    // if (widget.controller.position.pixels >= 200){
    //   hide();
    // }else {
    //   show();
    // }
  }

  show() {
    if (!isVisible) {
      setState(() => isVisible = true);
    }
  }

  hide() {
    if (isVisible) {
      setState(() => isVisible = false);
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: isVisible ? 60 : 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Wrap(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomBottomNavigationItem(
                  onTap: () {
                    context
                        .read<AppStateManager>()
                        .changeNavigationBottomSelected('home');
                  },
                  icon: Icons.home,
                  label: 'Home',
                  isSelected: 'home',
                ),
                CustomBottomNavigationItem(
                  onTap: () {
                    context
                        .read<AppStateManager>()
                        .changeNavigationBottomSelected('requests');
                  },
                  icon: Icons.receipt,
                  label: 'Requests',
                  isSelected: 'requests',
                ),
                CustomBottomNavigationItem(
                  onTap: () {
                    context
                        .read<AppStateManager>()
                        .changeNavigationBottomSelected('orders');
                  },
                  icon: Icons.record_voice_over,
                  label: 'Orders',
                  isSelected: 'orders',
                ),
                CustomBottomNavigationItem(
                  onTap: () {
                    context
                        .read<AppStateManager>()
                        .changeNavigationBottomSelected('transactions');
                  },
                  icon: Icons.transfer_within_a_station_sharp,
                  label: 'Transactions',
                  isSelected: 'transactions',
                ),
              ],
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: ColorConstants.someRockGreen,
        // borderRadius: const BorderRadius.only(
        //     topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
    );
  }
}

class CustomBottomNavigationItem extends StatelessWidget {
  const CustomBottomNavigationItem({
    Key? key,
    required this.onTap,
    required this.isSelected,
    required this.label,
    required this.icon,
  }) : super(key: key);

  final void Function()? onTap;
  final String isSelected;
  final String label;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  size: isSelected ==
                          context
                              .watch<AppStateManager>()
                              .navigationBottomSelected
                      ? 20
                      : 18,
                  color: isSelected ==
                          context
                              .watch<AppStateManager>()
                              .navigationBottomSelected
                      ? Colors.white
                      : Colors.black),
              Text(
                label,
                style: TextStyle(
                    fontSize: isSelected ==
                            context
                                .watch<AppStateManager>()
                                .navigationBottomSelected
                        ? 14
                        : 12,
                    color: isSelected ==
                            context
                                .watch<AppStateManager>()
                                .navigationBottomSelected
                        ? Colors.white
                        : Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key, required this.data, required this.controller})
      : super(key: key);

  final Size data;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopSellers(),
          const SizedBox(
            height: 15,
          ),
          const TrendingProducts(),
          const SizedBox(
            height: 15,
          ),
          Categories(
            controller: controller,
            width: data.width,
            height: data.height,
          )
        ],
      ),
    );
  }
}

// BottomNavigationBar(
//           enableFeedback: true,
//           iconSize: 18,
//           showUnselectedLabels: true,
//           currentIndex: _selectedItem,
//           onTap: _bootomNavigatorOnTap,
//           selectedFontSize: 16,
//           // selectedItemColor: ColorConstants.someRockGreen,
//           selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
//           elevation: 10,
//           items: [
//             BottomNavigationBarItem(

//               icon: const Icon(
//                 Icons.dashboard,
//               ),
//               label: 'Dashboard',
//               backgroundColor: ColorConstants.someRockGreen,
//             ),
//             BottomNavigationBarItem(
//               icon: const Icon(
//                 Icons.receipt,
//               ),
//               label: 'Request',
//               backgroundColor: ColorConstants.someRockGreen,
//             ),
//             BottomNavigationBarItem(
//               icon: const Icon(
//                 Icons.record_voice_over_rounded,
//               ),
//               label: 'Orders',
//               backgroundColor: ColorConstants.someRockGreen,
//             ),
//             BottomNavigationBarItem(
//               icon: const Icon(
//                 Icons.transfer_within_a_station_sharp,
//               ),
//               label: 'Transaction',
//               backgroundColor: ColorConstants.someRockGreen,
//             ),
//           ]),
