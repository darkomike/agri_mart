
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../components/components.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: GO to profile...
        context.goNamed('profile');
      },
      child: Hero(
        tag: 'profile',
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage(AssetsConstant.profilePic2),
          ),
        ),
      ),
    );
  }
}
