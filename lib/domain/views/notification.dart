import 'package:flutter/material.dart';

import '../../components/widgets/custom_app_drawer.dart';
import '../../components/widgets/custom_list_tile.dart';

class NotificationPage extends StatefulWidget {
 const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            drawer: const AppDrawer(),

      appBar: AppBar(title: const Text('Notifications')),  
      body: Container(
    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
    child: ListView(
      key: UniqueKey(),
      physics: const ClampingScrollPhysics(),
      children: const [
       CustomListTile(title: "Notification 1 ")
      ],
    ),
      ),
    );
  }
}
