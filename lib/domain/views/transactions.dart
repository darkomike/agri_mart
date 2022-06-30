import 'package:flutter/material.dart';

import '../../components/widgets/custom_app_drawer.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            drawer: const AppDrawer(),

      body: Center(
        child: Text(
          "Transactions",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
