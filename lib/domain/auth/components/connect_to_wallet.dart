import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../components/components.dart';
import '../../../components/provider/app_provider.dart';
import '../../domain.dart';

class ConnectToWalletWidget extends StatefulWidget {
  const ConnectToWalletWidget(
      {Key? key,
      required this.textEditingController,
      required this.height,
      required this.width})
      : super(key: key);

  final double height;
  final double width;
  final TextEditingController textEditingController;

  @override
  State<ConnectToWalletWidget> createState() => _ConnectToWalletWidgetState();
}

class _ConnectToWalletWidgetState extends State<ConnectToWalletWidget> {
  final List<String> _userTypes = ["Seller", "Buyer"];

  String _selectedTypeSelected = "Buyer";

  bool _isConnecingtLabel = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieWidget(
              width: widget.width,
              height: widget.height,
              lottiePath: AssetsConstant.connectWalletLottie),
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            minWidth: widget.width - 30,
            elevation: 2,
          ),
        ],
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
                                  widget.textEditingController.clear();
                                },
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.black,
                                )),
                            controller: widget.textEditingController,
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
                                          () => _selectedTypeSelected = value!);
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
                            onPressed: validateMetaMuskID(
                                    widget.textEditingController.text)
                                ? () {
                                    setState(() => _isConnecingtLabel = true);

                                    //TODO: Connect to MetaMusk.......
                                    Future.delayed(const Duration(seconds: 10),
                                        (() {
                                      Navigator.pop(context);

                                      context
                                          .read<AppStateManager>()
                                          .setIsLoggedIn(true);
                                      context.go('/');
                                    }));
                                  }
                                : null,
                            child: Text(
                              _isConnecingtLabel == true
                                  ? 'Connecting...'
                                  : 'Connect',
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
