import 'package:block_agri_mart/components/components.dart';
import 'package:block_agri_mart/domain/nav/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstants.primaryColor.withOpacity(.5),
            ),
            width: size.width - 10,
            child: Stack(
              children: [
                const Positioned(
                    left: 10,
                    top: 10,
                    child: Text(
                      'MetaMush ID',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )),
                Positioned(
                    left: 10,
                    bottom: 10,
                    child: Text(
                      'Account balance',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red.withOpacity(0.8),
                          fontWeight: FontWeight.w500),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Trading History',
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    tileColor: ColorConstants.primaryColor.withOpacity(.2),
                    leading: const CircleAvatar(),
                  );
                },
                separatorBuilder: ((context, index) {
                  return const SizedBox(
                    height: 3,
                  );
                }),
                itemCount: 3),
          )
        ],
      ),
    );
  }
}
