import 'package:go_router/go_router.dart';
import 'package:go_router_learn/page_0.dart';
import 'package:go_router_learn/page_1.dart';
import 'package:go_router_learn/page_2.dart';

import 'routes.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: Routes.page0,
  routes: [
    GoRoute(
      path: Routes.page0,
      builder: (context, state) => const Page0(),
    ),
    GoRoute(
      path: Routes.page1,
      builder: (context, state) => const Page1(),
    ),
    GoRoute(
      path: Routes.page2,
      builder: (context, state) => const Page2(),
    ),
  ],
);
