import 'package:block_agri_mart/components/constants/assets_constant.dart';
import 'package:block_agri_mart/components/constants/text_constant.dart';
import 'package:block_agri_mart/components/theme/theme.dart';
import 'package:block_agri_mart/domain/appbar/custom_app_bar.dart';
import 'package:block_agri_mart/domain/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController? _itemQuantityController;

    final _scaffoldKey = GlobalKey<ScaffoldState>();

  

  @override
  void initState() {
    _itemQuantityController = TextEditingController(text: "0");
    super.initState();
  }

  @override
  void dispose() {
    _itemQuantityController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey, showCart: true, showNotification: true, title: '', showProfilePic: true,onTransparentBackground: true),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: data.size.width,
              height: data.size.height / 1.7,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AssetsConstant.pepper))),
              child: Stack(
                children: [
                  DetailsUpper(data: data),
                ],
              ),
            ),
          ),
          DetailsLower(
              data: data, itemQuantityController: _itemQuantityController),
        ],
      ),
    );
  }
}

class DetailsLower extends StatelessWidget {
  const DetailsLower({
    Key? key,
    required this.data,
    required TextEditingController? itemQuantityController,
  })  : _itemQuantityController = itemQuantityController,
        super(key: key);

  final MediaQueryData data;
  final TextEditingController? _itemQuantityController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
          width: data.size.width,
          height: data.size.height / 1.8,
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ItemNameAndPrice(),
              ItemQuantity(itemQuantityController: _itemQuantityController),
              const SizedBox(
                height: 10,
              ),
              const ItemDescription(),
              const Spacer(),
              const AddToCartButton(),
            ],
          ),
        ));
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        height: 50,
        color: ColorConstants.someRockGreen,
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Add to Card",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.shopping_cart,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

class ItemDescription extends StatelessWidget {
  const ItemDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [Text(TextConstant.dummyText4)],
    );
  }
}

class ItemQuantity extends StatelessWidget {
  const ItemQuantity({
    Key? key,
    required TextEditingController? itemQuantityController,
  })  : _itemQuantityController = itemQuantityController,
        super(key: key);

  final TextEditingController? _itemQuantityController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 5,
        ),
        MaterialButton(
          color: ColorConstants.greenPantone,
          minWidth: 20,
          height: 30,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 5,
        ), 
        // Container(
        //     height: 40,
        //     width: 60,
        //     child: TextField(
        //       showCursor: true,
        //       keyboardType: TextInputType.phone,
        //       textInputAction: TextInputAction.done,
        //       controller: _itemQuantityController,
              
        //       decoration: const InputDecoration(
                
        //           contentPadding: EdgeInsets.all(10),
        //           border: InputBorder.none),
        //     )),

        MaterialButton(
          child: Text("0", style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 18),),
           onPressed: (){}, 
           ),
            
        const SizedBox(
          width: 5,
        ),
        MaterialButton(
          color: Colors.redAccent,
          minWidth: 20,
          height: 30,
          onPressed: () {},
          child: const Icon(
            Icons.remove,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class ItemNameAndPrice extends StatelessWidget {
  const ItemNameAndPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Oranges",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "23.45 ETH",
            style: Theme.of(context).textTheme.headline3!.copyWith(
                fontSize: 20,
                color: Colors.red.shade400,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class DetailsUpper extends StatelessWidget {
  const DetailsUpper({
    Key? key,
    required this.data,
  }) : super(key: key);

  final MediaQueryData data;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: data.size.height / 6.5,
      left: 10,
      child: MaterialButton(
        onPressed: () {
          context.goNamed('profile');
        },
        child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.75),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(AssetsConstant.profilePic1),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Carrington Cash',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            )),
      ),
    );
  }
}
