import 'package:block_agri_mart/components/constants/assets_constant.dart';
import 'package:block_agri_mart/components/constants/text_constant.dart';
import 'package:block_agri_mart/components/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../drawer/drawer.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      appBar: AppBar(
          // scrolledUnderElevation: 5,
          elevation: 0.0,
          leading: SizedBox(
            height: 40,
            width: 40,
            child: IconButton(
              tooltip: "Open Drawer",
              icon: const Icon(Icons.menu),
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
            ),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 40,
                  child: Stack(
                    children: [
                      IconButton(
                        tooltip: "Open Cart",
                        icon: const Icon(Icons.shopping_cart),
                        onPressed: () {
                          //TODO: GO to notifications
                        },
                      ),
                      Positioned(
                        left: 2,
                        top: 2,
                        child: Container(
                            // height: 15,
                            //   width: 15,
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            decoration: BoxDecoration(
                                color: ColorConstants.someRockGreen,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Text(
                              "54",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //TODO: GO to profile...
                    context.goNamed('profile');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(AssetsConstant.profilePic2),
                    ),
                  ),
                )
              ],
            )
          ],
          title: Text(
            'Notifications',
            style:
                Theme.of(context).textTheme.headline2!.copyWith(fontSize: 22),
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: ListView(
          key: UniqueKey(),
          physics: const BouncingScrollPhysics(),
          children: [
            NotificationCard(
              title: 'Notification title',
              body: TextConstant.dummyText1,
              time: '12:30',
              onTap: () {
                showNotificationContent(context, data);
              },
            ),
           
          ],
        ),
      ),
    );
  }

  Future<dynamic> showNotificationContent(BuildContext context, MediaQueryData data) {
    return showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Container(
                        height: data.size.height / 2,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Column(
                          children: [
                            Text(
                              "Nofitication Title",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    );
                  });
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    required this.body, required this.time, required this.title,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final void Function()? onTap;
  final String time;
  final String title;
  final String  body;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: ColorConstants.someRockGreen,
        // foregroundColor: ColorConstants.someRockGreen,
        child: const Text(
          "AD",
          style: TextStyle(color: Colors.white),
        ),
      ),
      onTap: onTap,
      trailing:  Text(
        time,
        style: const  TextStyle(fontSize: 12),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 18),
      ),
      subtitle: Text(
        body,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
