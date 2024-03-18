import 'package:go_router/go_router.dart';
import 'package:go_router_learn/core/contants.dart';

import 'routes.dart';

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
  routes: $appRoutes,
);
