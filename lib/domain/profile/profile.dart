import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import '../nav/appbar/custom_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: CustomAppBar(
        isHome: false,
        scaffoldKey: _scaffoldKey,
        showCart: true,
        showNotification: true,
        onTransparentBackground: false,
        showProfilePic: false,
        title: '',
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(AssetsConstant.bgPic))),
                    height: 170,
                    width: data.size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.65),
                                borderRadius: BorderRadius.circular(5)),
                            child: const Text(
                              "Agrimart",
                              style: TextStyle(color: Colors.red),
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 5,
                    child: Hero(
                      tag: 'profile',
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            color: Theme.of(context)
                                .backgroundColor
                                .withOpacity(1)),
                        child: CircleAvatar(
                            backgroundImage:
                                AssetImage(AssetsConstant.profilePic2)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              duration: const Duration(milliseconds: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "0x234567898765433456",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontSize: 18, color: Colors.red.withOpacity(0.85)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: [
                      Center(
                        child: Text(
                          TextConstant.dummyText2,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Joined July 2022',
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(fontSize: 14),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    color: ColorConstants.primaryColor,
                    height: 40,
                    onPressed: () {},
                    child: const Text(
                      'Purchases',
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                            width: 1, color: ColorConstants.primaryColor)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  MaterialButton(
                    height: 40,
                    onPressed: () {},
                    color: Colors.grey.shade400,
                    child: const Text(
                      'Settings',
                      style: TextStyle(color: Colors.black),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              height: data.size.height - 140,
              child: PageView(
                physics: const ClampingScrollPhysics(),
                allowImplicitScrolling: true,
                pageSnapping: true,
                children: [
                  Container(
                    color: Theme.of(context).backgroundColor.withOpacity(1),
                    height: data.size.height - 120,
                    child: Center(
                      child: Text(
                        "No Purchases",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).backgroundColor.withOpacity(1),
                    height: data.size.height - 120,
                    child: Center(
                      child: Column(
                        children: [
                          SwitchListTile(
                              activeColor: ColorConstants.primaryColor,
                              title: Text(
                                context.watch<AppStateManager>().darkModeOn
                                    ? 'Dark Mode On'
                                    : 'Dark Mode Off',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(fontSize: 14),
                              ),
                              value:
                                  context.watch<AppStateManager>().darkModeOn,
                              onChanged: (value) {
                                context
                                    .read<AppStateManager>()
                                    .setIsDarkModeOn(value);
                              }),
                          ListTile(
                            title: Text(
                              'Logout',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(fontSize: 14),
                            ),
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
