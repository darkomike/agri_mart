import 'package:block_agri_mart/domain/home/components/see_all_top_sellers.dart';
import 'package:block_agri_mart/domain/home/components/see_all_trending_products.dart';
import 'package:block_agri_mart/domain/products/components/add_product.dart';
import 'package:block_agri_mart/domain/products/products.dart';
import 'package:go_router/go_router.dart';
import '../../domain/details/details.dart';
import '../provider/app_provider.dart';
import '../404.dart';
import '../../domain/auth/auth.dart';
import '../../domain/cart/cart.dart';
import '../../domain/home/home.dart';
import '../../domain/notifications/notification.dart';
import '../../domain/profile/profile.dart';
import '../../domain/requests/requests.dart';
import '../../domain/transactions/transactions.dart';

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

final detailsRouter = GoRoute(
    name: 'details',
    path: 'details',
    builder: (context, state) => const DetailsScreen());

// final ordersRouter = GoRoute(
//     name: 'orders',
//     path: 'orders',
//     builder: (context, state) => const RecommendsScreen());

final profileRouter = GoRoute(
    name: 'profile',
    path: 'profile',
    builder: (context, state) => const ProfileScreen());

// final productsRouter = GoRoute(
//     name: 'products',
//     path: 'products',
//     routes: [addProductRouter],
//     builder: (context, state) => const ProductsScreen());

final addProductRouter = GoRoute(
    name: 'add_product',
    path: 'add_product',
    builder: (context, state) => const AddProductScreen());

final notificationsRouter = GoRoute(
    name: 'notifications',
    path: 'notifications',
    builder: (context, state) => const NotificationPage());

final sellersRouter = GoRoute(
    name: 'sellers',
    path: 'sellers',
    builder: (context, state) => SeeAllTopSellerPage());

final trendingProductsRouter = GoRoute(
    name: 'trending_products',
    path: 'trending_products',
    builder: (context, state) => SeeAllTrendingProductsPage());

final homeRouter = GoRoute(
    name: 'home',
    path: '/',
    routes: [
      profileRouter,
      notificationsRouter,
      addProductRouter,
      sellersRouter,
      trendingProductsRouter,
      detailsRouter,
      cartRouter
    ],
    builder: (context, state) => const HomeScreen());

final requestsRouter = GoRoute(
    name: 'requests',
    path: 'requests',
    builder: (context, state) => const RequestsScreen());

final transactionsRouter = GoRoute(
    name: 'transactions',
    path: 'transactions',
    builder: (context, state) => const TransactionsScreen());
