import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../components/constants/assets_constant.dart';

class TopSellersCard extends StatelessWidget {
  const TopSellersCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 10,
      onPressed: () {},
      child: Container(
        height: 150,
        width: 190,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(colors: [
              Color(0xFF02AAB0),
              Color(0xFF00CDAC),
            ])),
        child: Stack(
          children: [
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 190,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AssetsConstant.bgPic)),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text("Carrington Cash "),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: RatingBarIndicator(
                      rating: 4.2,
                      itemCount: 5,
                      itemSize: 12.0,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Center(
                    child: Material(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFFF5F0EA).withOpacity(0.33),
                      child: SizedBox(
                        height: 50,
                        width: 170,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Products",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "527",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Sold",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "351",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Buyers",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "567",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 70,
              left: 5,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(AssetsConstant.profilePic2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
