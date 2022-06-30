import 'package:flutter/material.dart';

import '../../components/widgets/custom_app_drawer.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            drawer: const AppDrawer(),

      body: Center(
        child: Text(
          "Requests",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
