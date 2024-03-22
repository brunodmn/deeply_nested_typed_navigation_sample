import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_learn/pages/home/app_page.dart';
import 'package:go_router_learn/pages/home/settings_page.dart';
import '../pages/home/home_page.dart';
import '../pages/home/widgets/layout_page.dart';
import '../main.dart';
import '../pages/root/login_page.dart';
import '../pages/home/profile_page.dart';
import '../pages/root/splash_page.dart';

part 'routes.g.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shelSettingsNavigatorKey =
    GlobalKey<NavigatorState>();

//! ROOT - SPLASH ROUTE
@TypedGoRoute<SplashRoute>(path: '/')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashPage();
}

//! ROOT - LOGIN ROUTE
@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginPage();
}

//! ROOT - HOME SHELL ROUTE ROUTE
@TypedStatefulShellRoute<HomeShellRoute>(
  branches: [
    TypedStatefulShellBranch<HomeBranch>(
      routes: <TypedGoRoute<GoRouteData>>[
        TypedGoRoute<HomeRoute>(path: '/home', routes: [
          TypedGoRoute<AppRoute>(
            path: 'app/:id',
          ),
        ]),
      ],
    ),
    TypedStatefulShellBranch<SettingsBranch>(
      routes: [
        TypedStatefulShellRoute<SettingsShellRoute>(branches: [
          TypedStatefulShellBranch<GeneralBranch>(
              routes: [TypedGoRoute<GeneralRoute>(path: '/settings/general')]),
          TypedStatefulShellBranch<BillingBranch>(
              routes: [TypedGoRoute<BillingRoute>(path: '/settings/billing')]),
          TypedStatefulShellBranch<NotificationsBranch>(routes: [
            TypedGoRoute<NotificationsRoute>(path: '/settings/notifications')
          ]),
        ])
      ],
    ),
    TypedStatefulShellBranch<ProfileBranch>(
      routes: <TypedGoRoute<GoRouteData>>[
        TypedGoRoute<ProfileRoute>(
          path: '/profile',
        ),
      ],
    ),
    // TypedStatefulShellBranch<AppBranch>(
    //   routes: <TypedGoRoute<GoRouteData>>[
    //     TypedGoRoute<AppRoute>(
    //       path: '/app/:id',
    //     ),
    //   ],
    // ),
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

class ProfileBranch extends StatefulShellBranchData {
  const ProfileBranch();
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

class AppRoute extends GoRouteData {
  final String id;
  const AppRoute(this.id);

  @override
  Widget build(BuildContext context, GoRouterState state) => AppPage(id: id);
}

class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProfilePage(user: authRepo.currentUser!);
}

class ApplicationsRoute extends GoRouteData {
  const ApplicationsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => Container(
        alignment: Alignment.center,
        child: const Text('Applications'),
      );
}
