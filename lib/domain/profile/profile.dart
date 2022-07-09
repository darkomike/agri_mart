import 'package:block_agri_mart/components/constants/assets_constant.dart';
import 'package:block_agri_mart/domain/drawer/drawer.dart';
import 'package:flutter/material.dart';

import '../appbar/custom_app_bar.dart';

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
      drawer: const AppDrawer(),
      key: _scaffoldKey,
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
        showCart: true,
        showNotification: true,
        title: '',
      ),
      body: Container(
        child: Column(
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
                  MaterialButton(
                      onPressed: () {},
                      color: Colors.white.withOpacity(0.60),
                      child: const Text(
                        "Agrimart",
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              ),
            ), 
            Center(
              child: Text(
                "Profile",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
