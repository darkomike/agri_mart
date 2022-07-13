import 'package:block_agri_mart/components/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../nav/appbar/custom_app_bar.dart';
import '../drawer/drawer.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        itemCount: 20,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
        return  RequestCard(
              body: TextConstant.dummyText1,
              time: '23:34',
              title: 'Request title');
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



class RequestCard extends StatelessWidget {
  const RequestCard({
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
          "R",
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
