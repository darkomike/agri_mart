import 'package:block_agri_mart/domain/views/add_product.dart';
import 'package:block_agri_mart/domain/views/products.dart';
import 'package:go_router/go_router.dart';
import '../../domain/provider/app_provider.dart';
import '../../domain/views/404.dart';
import '../../domain/views/auth.dart';
import '../../domain/views/cart.dart';
import '../../domain/views/home.dart';
import '../../domain/views/notification.dart';
import '../../domain/views/orders.dart';
import '../../domain/views/profile.dart';
import '../../domain/views/requests.dart';
import '../../domain/views/transactions.dart';

final appRouter = GoRouter(
    initialLocation: '/auth',
    refreshListenable: appStateManager,
    urlPathStrategy: UrlPathStrategy.path,
    debugLogDiagnostics: true,
    routes: [homeRouter, authRouter],
    redirect: (state) {
      // if the user is not logged in, they need to login
      final loggedIn = appStateManager.loggedIn;
      final loggingIn = state.subloc == '/auth';
      if (!loggedIn) return loggingIn ? null : '/auth';

      // if the user is logged in but still on the login page, send them to
      // the home page
      if (loggingIn) return '/';

      // no need to redirect at all
      return null;
    },
    errorBuilder: (context, state) => const Page404());




final authRouter = GoRoute(
    name: 'auth',
    path: '/auth',
    builder: (context, state) => const AuthScreen());


final cartRouter = GoRoute(
    name: 'cart',
    path: 'cart',
    builder: (context, state) => const CartScreen());


final ordersRouter = GoRoute(
    name: 'orders',
    path: 'orders',
    builder: (context, state) => const OrdersScreen());



final profileRouter = GoRoute(
    name: 'profile',
    path: 'profile',
    builder: (context, state) => const ProfileScreen());


final productsRouter = GoRoute(
    name: 'products',
    path: 'products',
    routes: [addProductRouter],
    builder: (context, state) => const ProductsScreen());


final addProductRouter = GoRoute(
    name: 'add_product',
    path: 'add_product',
    builder: (context, state) => const AddProductScreen());





final notificationsRouter = GoRoute(
    name: 'notifications',
    path: 'notifications',
    builder: (context, state) => const NotificationPage());

final homeRouter = GoRoute(
    name: 'home', path: '/', 
    routes: [profileRouter,notificationsRouter, ordersRouter, transactionsRouter, requestsRouter, productsRouter, cartRouter ],
    builder: (context, state) => const HomeScreen())
    
    ;




final requestsRouter = GoRoute(
    name: 'requests',
    path: 'requests',
    builder: (context, state) => const RequestsScreen());



final transactionsRouter = GoRoute(
    name: 'transactions',
    path: 'transactions',
    builder: (context, state) => const TransactionsScreen());
