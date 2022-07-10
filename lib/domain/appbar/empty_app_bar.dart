

import 'package:flutter/material.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBar(
      {Key? key })
      : super(key: key);



  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return  AppBar();
  }
}
