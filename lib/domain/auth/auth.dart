import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  String? _selectedTypeSelected;
  final List<String> _userTypes = ["Seller", "Buyer"];
  TextEditingController? _metaMuskIdController;
  bool connect = false;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _selectedTypeSelected = "Seller";
    _metaMuskIdController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _metaMuskIdController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Is Logged In: ${appStateManager.loggedIn}");

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          print("Height in layout: ${constraints.maxHeight}");
          print("Width in layout: ${constraints.maxWidth}");
          return Container(
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LottieWidget(width: width, height: height),
                const WelcomeMessage(),
                const SizedBox(height: 10),
                MaterialButton(
                  onPressed: () {
                    _showConnectDialog(context);
                  },
                  child: Text(
                    "Connect to Wallet",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.white, fontSize: 16),
                  ),
                  height: 50,
                  color: ColorConstants.greenPantone,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  minWidth: width - 30,
                  elevation: 2,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> _showConnectDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              insetAnimationCurve: Curves.fastLinearToSlowEaseIn,
              insetAnimationDuration: const Duration(milliseconds: 1500),
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    height: 270,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ConnectWalletDialogTitle(),
                        Container(
                          height: 40,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: CustomTextFormField(
                            autofocus: false,
                            validator: (value) {
                              return validateMetaMuskID(value!)
                                  ? null
                                  : "Invalid ID";
                            },
                            hintText: 'Enter your Meta Musk ID',
                            focusColor: ColorConstants.greenPantone,
                            suffix: IconButton(
                                onPressed: () {
                                  _metaMuskIdController!.clear();
                                },
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.black,
                                )),
                            controller: _metaMuskIdController!,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                child: Text(
                                  "Connect as : ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                height: 35,
                                width: 100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1.5,
                                      color: ColorConstants.greenPantone),
                                ),
                                child: DropdownButton<String>(
                                    underline: Container(),
                                    value: _selectedTypeSelected,
                                    items: _userTypes.map((String value) {
                                      return DropdownMenuItem<String>(
                                        child: Text(value),
                                        value: value,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(
                                          () => _selectedTypeSelected = value);
                                    }),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: MaterialButton(
                            minWidth: 250,
                            height: 40,
                            color: ColorConstants.someRockGreen,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            onPressed:
                                validateMetaMuskID(_metaMuskIdController!.text)
                                    ? () {
                                        setState(() => connect = true);

                                        //TODO: Connect to MetaMusk.......
                                        Future.delayed(
                                            const Duration(seconds: 10), (() {
                                          Navigator.pop(context);

                                          Provider.of<AppStateManager>(context,
                                                  listen: false)
                                              .setIsLoggedIn(true);
                                          context.go('/');
                                        }));
                                      }
                                    : null,
                            child: Text(
                              connect == true ? 'Connecting...' : 'Connect',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ));
        });
  }

  bool validateMetaMuskID(String metaMuskId) {
    //TODO: Write Metamusk Id validation code..
    return true;
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
  const LottieWidget({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: LottieBuilder.asset(
        "assets/lottie/two-factor-authentication.json",
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
