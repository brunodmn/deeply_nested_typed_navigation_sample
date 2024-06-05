import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_learn/pages/home/app_page.dart';
import 'package:go_router_learn/pages/home/app_tab_view.dart';
import 'package:go_router_learn/pages/home/settings_page.dart';
import '../pages/home/home_page.dart';
import '../pages/home/widgets/layout_page.dart';
import '../main.dart';
import '../pages/root/splash_page.dart';

part 'routes.g.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shelSettingsNavigatorKey =
    GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _shellAppNavigatorKey =
    GlobalKey<NavigatorState>();

//! ROOT - SPLASH ROUTE
@TypedGoRoute<SplashRoute>(path: '/')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashPage();
}


//! ROOT - HOME SHELL ROUTE ROUTE
@TypedStatefulShellRoute<HomeShellRoute>(
  branches: [
    TypedStatefulShellBranch<HomeBranch>(
      routes: <TypedGoRoute<GoRouteData>>[
        TypedGoRoute<HomeRoute>(path: '/home'),
      ],
    ),
    TypedStatefulShellBranch<SettingsBranch>(
      routes: [
        TypedGoRoute<SettingsRoute>(path: '/settings', routes: [
          TypedStatefulShellRoute<SettingsShellRoute>(branches: [
            TypedStatefulShellBranch<GeneralBranch>(
                routes: [TypedGoRoute<GeneralRoute>(path: 'general')]),
            TypedStatefulShellBranch<BillingBranch>(
                routes: [TypedGoRoute<BillingRoute>(path: 'billing')]),
            TypedStatefulShellBranch<NotificationsBranch>(routes: [
              TypedGoRoute<NotificationsRoute>(path: 'notifications')
            ]),
          ])
        ]),
      ],
    ),
    
    TypedStatefulShellBranch<AppsBranch>(
      routes: <TypedGoRoute<GoRouteData>>[
        TypedGoRoute<AppsRoute>(path: '/apps', routes: [
          TypedGoRoute<AppRoute>(path: ':id', routes: [
            TypedStatefulShellRoute<AppShellRoute>(branches: [
              TypedStatefulShellBranch<AppGeneralBranch>(
                  routes: [TypedGoRoute<AppGeneralRoute>(path: 'general')]),
              TypedStatefulShellBranch<AppSupporBranch>(
                  routes: [TypedGoRoute<AppSupportRoute>(path: 'support')]),
            ])
          ]),
        ]),
      ],
    ),
  ],
)
class HomeShellRoute extends StatefulShellRouteData {
  const HomeShellRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = _shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state,
      StatefulNavigationShell navigationShell) {
    return LayoutPage(
      navigationShell: navigationShell,
    );
  }
}

//* /apps/:id/
class AppShellRoute extends StatefulShellRouteData {
  const AppShellRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = _shellAppNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state,
      StatefulNavigationShell navigationShell) {
    print('${state.pathParameters}');
    return AppTabPage(navigationShell: navigationShell);
  }
}

//* /apps/:id/general
class AppGeneralBranch extends StatefulShellBranchData {
  const AppGeneralBranch();
}

class AppGeneralRoute extends GoRouteData {
  final String id;
  const AppGeneralRoute(this.id);

  @override
  Widget build(BuildContext context, GoRouterState state) => Container(
        alignment: Alignment.center,
        child: const Text('AppGeneralRoute'),
      );
}

//* /apps/:id/support
class AppSupporBranch extends StatefulShellBranchData {
  const AppSupporBranch();
}

class AppSupportRoute extends GoRouteData {
  final String id;
  const AppSupportRoute(this.id);

  @override
  Widget build(BuildContext context, GoRouterState state) => Container(
        alignment: Alignment.center,
        child: const Text('AppSupportRoute'),
      );
}

class SettingsShellRoute extends StatefulShellRouteData {
  const SettingsShellRoute();
  // static final GlobalKey<NavigatorState> $parentNavigatorKey =
  //     _shellNavigatorKey;
  static final GlobalKey<NavigatorState> $navigatorKey =
      _shelSettingsNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state,
      StatefulNavigationShell navigationShell) {
    return SettingsPage(navigationShell: navigationShell);
  }
}

//* TAB GENERAL
class AppsBranch extends StatefulShellBranchData {
  const AppsBranch();
}

class AppsRoute extends GoRouteData {
  const AppsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
            ...apiRepo.apps.map((e) => Card(
                  child: ListTile(
                    title: Text(e.name),
                    onTap: () => AppRoute(e.id).go(context),
                  ),
                ))
          ],
        ),
      );
}

//* TAB Billing
class GeneralBranch extends StatefulShellBranchData {
  const GeneralBranch();
}

class GeneralRoute extends GoRouteData {
  const GeneralRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => Container(
        alignment: Alignment.center,
        child: const Text('GeneralRoute'),
      );
}

//* TAB Billing
class BillingBranch extends StatefulShellBranchData {
  const BillingBranch();
}

class BillingRoute extends GoRouteData {
  const BillingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => Container(
        alignment: Alignment.center,
        child: const Text('Billing'),
      );
}

//* TAB Notifications
class NotificationsBranch extends StatefulShellBranchData {
  const NotificationsBranch();
}

class NotificationsRoute extends GoRouteData {
  const NotificationsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => Container(
        alignment: Alignment.center,
        child: const Text('Notifications'),
      );
}

// TAB BILLING
//* branchs
class HomeBranch extends StatefulShellBranchData {
  const HomeBranch();
}

class SettingsBranch extends StatefulShellBranchData {
  const SettingsBranch();
}


class AppBranch extends StatefulShellBranchData {
  const AppBranch();
}

//* routes
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

class SettingsRoute extends GoRouteData {
  const SettingsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => Container();

  @override
  String? redirect(BuildContext context, GoRouterState state) {
    if (state.fullPath == location) {
      return const GeneralRoute().location;
    }
    return null;
  }
}

class AppRoute extends GoRouteData {
  final String id;
  const AppRoute(this.id);
  @override
  String? redirect(BuildContext context, GoRouterState state) {
    if (state.matchedLocation == location) {
      return AppGeneralRoute(id).location;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) => AppPage(id: id);
}



class ApplicationsRoute extends GoRouteData {
  const ApplicationsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => Container(
        alignment: Alignment.center,
        child: const Text('Applications'),
      );
}
