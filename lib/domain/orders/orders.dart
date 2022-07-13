import 'package:block_agri_mart/components/components.dart';
import 'package:flutter/material.dart';

import '../nav/appbar/custom_app_bar.dart';
import '../drawer/drawer.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        itemCount: 20,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
        return  OrderCard(
              body: TextConstant.dummyText1,
              time: '23:34',
              title: 'Order title');
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



class OrderCard extends StatelessWidget {
  const OrderCard({
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
          "O",
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
