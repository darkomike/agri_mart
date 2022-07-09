import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../components/constants/assets_constant.dart';
import '../appbar/custom_app_bar.dart';
import '../drawer/drawer.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      drawer: const AppDrawer(),
                 appBar: CustomAppBar(scaffoldKey: _scaffoldKey, showCart: true, showNotification: false, title: 'Requests',),


      body: Center(
        child: Text(
          "Requests",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
