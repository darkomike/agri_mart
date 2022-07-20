import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/components.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 150,
              color: Colors.amber,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'No items in cart',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
                minWidth: 150,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: ColorConstants.primaryColor)),
                child: Text(
                  'Add Items',
                  style: TextStyle(color: ColorConstants.primaryColor),
                ),
                onPressed: () {
                  context.goNamed('home');
                })
          ],
        ),
      ),
    );
  }
}
