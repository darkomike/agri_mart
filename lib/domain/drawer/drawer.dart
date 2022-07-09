import 'package:block_agri_mart/components/widgets/widgets.dart';
import 'package:block_agri_mart/components/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        children: [
          CustomListTile(
            title: 'Dashboard',
            onTap: () {
              context.goNamed('home');
              Navigator.pop(context);
            },
          ),
          const Divider(
            height: 5,
          ),
         Provider.of<AppStateManager>(context).userType == "Seller" ?   CustomListTile(
            title: 'Requests',
            onTap: () {
              context.goNamed('requests');
            },
          ) :

          CustomListTile(
            title: 'Orders',
            onTap: () {
              context.goNamed('orders');
            },
          ),
          const Divider(
            height: 5,
          ),
          CustomListTile(
            title: 'Products',
            onTap: () {
              context.goNamed('products');
            },
          ),
          const Divider(
            height: 5,
          ),
          CustomListTile(
            title: 'Profile',
            onTap: () {
              context.goNamed('profile');
            },
          ),
          const Divider(
            height: 5,
          ),
          CustomListTile(
            title: 'Transactions',
            onTap: () {
              context.goNamed('transactions');
            },
          ),
          const Divider(
            height: 5,
          ),
          CustomListTile(
            title: 'Notifications',
            onTap: () {
              context.goNamed('notifications');
            },
          ),
          const Divider(
            height: 5,
          ),
          CustomListTile(
            title: 'Logout',
            onTap: () {
              context.read<AppStateManager>().setIsLoggedIn(false);
            },
          ),
        ],
      ),
    );
  }
}
