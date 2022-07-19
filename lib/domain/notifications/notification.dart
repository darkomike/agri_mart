import 'package:flutter/material.dart';
import '../../components/components.dart';
import '../nav/appbar/custom_app_bar.dart';

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
        appBar: CustomAppBar(
            isHome: false,
            scaffoldKey: _scaffoldKey,
            showCart: true,
            showNotification: false,
            title: 'Notifications',
            showProfilePic: true,
            onTransparentBackground: false),
        body: Container(
          // color: Colors.white,
          child: ListView.separated(
            itemCount: 20,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return NotificationCard(
                  body: TextConstant.dummyText1,
                  time: '23:34',
                  title: 'Notication title');
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 4,
              );
            },
          ),
        ));
  }

  Future<dynamic> showNotificationContent(
      BuildContext context, MediaQueryData data) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: data.size.height / 2,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
    required this.body,
    required this.time,
    required this.title,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final void Function()? onTap;
  final String time;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        
      borderRadius: BorderRadius.circular(5)),
      tileColor: ColorConstants.primaryColor.withOpacity(.2),
      leading: CircleAvatar(
        backgroundColor: ColorConstants.primaryColor,
        // foregroundColor: ColorConstants.someRockGreen,
        child: const Text(
          "T",
          style: TextStyle(color: Colors.white),
        ),
      ),
      onTap: onTap,
      trailing: Text(
        time,
        style: const TextStyle(fontSize: 12),
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
