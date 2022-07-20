import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../components/components.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({Key? key, required this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: GO to profile...
        context.goNamed('profile');
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Theme.of(context).backgroundColor,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User Logout",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Tap logout to confirm",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                           
                            Expanded(
                                child: MaterialButton(
                                    height: 40,
                                    color: ColorConstants.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(
                                          width: 1,
                                          color: ColorConstants.primaryColor,
                                        )),
                                    child: const Text(
                                      "Confirm Logout",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      context
                                          .read<AppStateManager>()
                                          .setIsLoggedIn(false);
                                    })),
                          ],
                        ),
                      ],
                    ),
                  ),
                  elevation: 10,
                ));
      },
      child: Hero(
        tag: 'profile',
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage(AssetsConstant.profilePic2),
          ),
        ),
      ),
    );
  }
}
