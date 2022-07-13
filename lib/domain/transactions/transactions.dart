import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../domain.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        itemCount: 20,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
        return  TransactionCard(
              body: TextConstant.dummyText1,
              time: '23:34',
              title: 'Transaction title');
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 4,
          );
        },
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  const TransactionCard({
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
      leading: CircleAvatar(
        backgroundColor: ColorConstants.someRockGreen,
        // foregroundColor: ColorConstants.someRockGreen,
        child: const Text(
          "P",
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
