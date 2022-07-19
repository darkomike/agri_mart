import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import 'components/connect_to_wallet.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TextEditingController _metaMuskController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _metaMuskController = TextEditingController();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _metaMuskController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Is Logged In: ${appStateManager.loggedIn}");

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  context.read<AppStateManager>().changeAuthPageIndex(index);
                },
                pageSnapping: true,
                children: [
                  Container(
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LottieWidget(
                                width: width,
                                height: height,
                                lottiePath: AssetsConstant.homepageLottie),
                            Text(
                              "Welcome to Agrimart",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LottieWidget(
                                width: width,
                                height: height,
                                lottiePath: AssetsConstant.networkedDataLottie),
                            Text(
                              "Connect with Customers",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LottieWidget(
                                width: width,
                                height: height,
                                lottiePath: AssetsConstant.networkedDataLottie),
                            Text(
                              "Sell your Agro-Produce",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                            ),
                          ]),
                    ),
                  ),
                  ConnectToWalletWidget(
                      textEditingController: _metaMuskController,
                      height: height,
                      width: width),
                ],
              ),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    visible: context.watch<AppStateManager>().authPageIndex == 3
                        ? false
                        : true,
                    child: MaterialButton(
                      minWidth: 100,
                      height: 45,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: ColorConstants.primaryColor,
                      onPressed: () {
                        print(_pageController.offset);
                        print(_pageController.initialPage);
                        _pageController.animateToPage(3,
                            duration: const Duration(microseconds: 600),
                            curve: Curves.ease);
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Center(
            child: Text(
              "Discover, buy and sell quality Agro-products and services.",
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Center(
            child: Text(
              "AgriMart is the world's and largest\ndigital Argo-product marketplace.",
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "You need an ethereum wallet to use AgriMart",
            style: Theme.of(context).textTheme.headline3!.copyWith(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class LottieWidget extends StatelessWidget {
  const LottieWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.lottiePath})
      : super(key: key);

  final double width;
  final double height;
  final String lottiePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: LottieBuilder.asset(
        lottiePath,
        width: width / 1.5,
        height: height / 2.5,
      ),
    );
  }
}

class ConnectWalletDialogTitle extends StatelessWidget {
  const ConnectWalletDialogTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      alignment: Alignment.center,
      child: Text(
        "Connect Wallet ",
        style: Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
