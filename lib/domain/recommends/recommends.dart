import 'package:block_agri_mart/components/components.dart';
import 'package:flutter/material.dart';


class RecommendsScreen extends StatefulWidget {
  const RecommendsScreen({Key? key}) : super(key: key);

  @override
  State<RecommendsScreen> createState() => _RecommendsScreenState();
}

class _RecommendsScreenState extends State<RecommendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ListView.separated(
        itemCount: 1,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return RecommendCard(
              body: TextConstant.dummyText1,
              time: '23:34',
              title: 'Product recommend');
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

class RecommendCard extends StatelessWidget {
  const RecommendCard({
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      tileColor: ColorConstants.primaryColor.withOpacity(.2),
      leading: CircleAvatar(
        backgroundColor: ColorConstants.primaryColor,
        // foregroundColor: ColorConstants.someRockGreen,
        child: const Text(
          "R",
          style: TextStyle(color: Colors.white),
        ),
      ),
      onTap: onTap,
      trailing: Text(
        time,
                style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 10),

      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 16),
      ),
      subtitle: Text(
        body,
                style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 12),

        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
