import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_learn/page_0.dart';
import 'package:go_router_learn/page_1.dart';
import 'package:go_router_learn/page_2.dart';
import 'package:go_router_learn/page_3.dart';

import 'routes.dart';

// Create keys for `root` & `section` navigator avoiding unnecessary rebuilds
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();
// GoRouter configuration
final router = GoRouter(
  initialLocation: Routes.page3,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: Routes.page0,
      builder: (context, state) => const Page0(),
    ),
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => Page3(navigationShell),
        branches: [
          StatefulShellBranch(navigatorKey: _sectionNavigatorKey, routes: [
            GoRoute(
              path: Routes.page3,
              builder: (context, state) => const Material(
                color: Colors.blue,
              ),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/red',
              builder: (context, state) => const Material(
                color: Colors.red,
              ),
            ),
          ])
        ]),
    // GoRoute(
    //   path: Routes.page3,
    //   builder: (context, state) => const Page3(),
    // ),
    GoRoute(
        path: Routes.page1,
        builder: (context, state) => const Page1(),
        routes: [
          GoRoute(
            path: Routes.page2,
            builder: (context, state) => const Page2(),
          ),
        ]),
  ],
);
