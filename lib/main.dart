import 'package:block_agri_mart/domain/cart/provider/cart_provider.dart';
import 'package:block_agri_mart/domain/products/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'components/routes/routes.dart';
import 'components/theme/dark_theme.dart';
import 'components/theme/light_theme.dart';
import 'components/provider/app_provider.dart';
import 'domain/home/provider/home_provider.dart';

late SharedPreferences prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  prefs.setBool("loggedIn", prefs.getBool('loggedIn') ?? false);
  prefs.setString("userType", prefs.getString('userType') ?? "Buyer");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => appStateManager),
        ChangeNotifierProvider(create: (context) => homeStateManager),
        ChangeNotifierProvider(create: (context) => productStateManager),
        ChangeNotifierProvider(create: (context) => cartStateManager),
      ],
      child: Consumer<AppStateManager>(builder: ((context, appState, child) {
        ThemeData theme;
        if (appState.darkModeOn) {
          theme = DarkTheme.dark();
        } else {
          theme = LightTheme.light();
        }
        return MaterialApp.router(
          routeInformationParser: appRouter.routeInformationParser,
          routerDelegate: appRouter.routerDelegate,
          title: 'AgriMart',
          debugShowCheckedModeBanner: false,
          theme: theme,

          // darkTheme: AppTheme.dark(),
        );
      })),
    );
  }
}
