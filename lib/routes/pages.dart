import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    return null;
  
    // final user = authRepo.currentUser;
    // if (user == null) {
    //   // necessary or navitagion will skip splash screen
    //   if (state.fullPath == '/') return null;
    //   return const SplashRoute().location;
    // } else {
    //   if (state.fullPath == '/' || state.fullPath == '/login') {
    //     return const HomeRoute().location;
    //   }
    //   return null; // return "null" to display the intended route without redirecting
    // }
  },
  routes: $appRoutes,
  navigatorKey: rootNavigatorKey,
);
