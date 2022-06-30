import 'package:flutter/material.dart';

import '../../components/widgets/custom_app_drawer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            drawer: const AppDrawer(),

      body: Center(
        child: Text(
          "Orders",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
