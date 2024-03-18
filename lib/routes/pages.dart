import 'package:go_router/go_router.dart';
import 'package:go_router_learn/contants.dart';
import 'package:go_router_learn/pages/login_page.dart';
import 'package:go_router_learn/pages/profile_page.dart';
import 'package:go_router_learn/pages/splash_page.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    if (!isLoggedIn) {
      // necessary or navitagion will skip splash screen
      if (state.fullPath == '/') return null;
      print('redirecting ${state.fullPath}');
      return '/login';
    } else {
      return null; // return "null" to display the intended route without redirecting
    }
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
    ),
  ],
);
