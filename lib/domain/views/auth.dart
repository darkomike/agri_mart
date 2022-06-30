import 'package:block_agri_mart/components/theme/color_constant.dart';
import 'package:block_agri_mart/components/widgets/custom_textfeild.dart';
import 'package:block_agri_mart/domain/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../components/widgets/custom_elevated_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  String? _selectedTypeSelected;

  List<String> _userTypes = ["Seller", "Buyer"];
  TextEditingController? _metaMuskIdController;

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
               WelcomeMessage(),
                CustomElevatedButton(
                  
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.all<Color>(
                    ColorConstants.greenPantone,
                  ),
                  overlayColor: MaterialStateProperty.all<Color>(
                    ColorConstants.someRockGreen,
                  ),
                  buttonOutlineColor: ColorConstants.greenPantone,
                  title: "Connect to Wallet",
                  onPressed: () {
                    _showConnectDialog(context);
                  },
                  elevation: 5,
                  titleStyle:
                      const TextStyle(color: Colors.white, fontSize: 16),
                  height: 60,
                  
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
            insetAnimationCurve: Curves.fastLinearToSlowEaseIn , insetAnimationDuration: const Duration(seconds: 3),
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
                            height: 40,
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
                                  borderRadius: BorderRadius.circular(20),
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
                          child: CustomElevatedButton(
                            title: 'Connect',
                            titleStyle: const TextStyle(color: Colors.white),
                            buttonOutlineColor: ColorConstants.greenPantone,
                            height: 40,
                            width: 250,
                            elevation: 0.5,
                            overlayColor: MaterialStateProperty.all<Color>(
                            ColorConstants.someRockGreen),
                            backgroundColor: MaterialStateProperty.all<Color>(
                          ColorConstants.greenPantone,
                            ),
                            onPressed:
                            validateMetaMuskID(_metaMuskIdController!.text)
                                ? () {
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
    //TODO: Write Metamusk Id validation code
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
       padding:
           const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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
       padding:
           const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
       padding:
           const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 5),
      alignment: Alignment.center,
      child: Text(
        "Connect Wallet ",
        style: Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(
                fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
