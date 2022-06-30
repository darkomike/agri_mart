import 'package:flutter/material.dart';

import '../../components/widgets/custom_app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: Center(
        child:  Text('Home', style: Theme.of(context).textTheme.headline3,),
      ),
    );
  }
}