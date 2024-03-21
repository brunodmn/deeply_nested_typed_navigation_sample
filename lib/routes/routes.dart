import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
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
          TypedGoRoute<ApplicationsRoute>(path: 'applications'),
        ]),
      ],
    ),
    TypedStatefulShellBranch<SettingsBranch>(
      routes: <TypedGoRoute<GoRouteData>>[
        TypedGoRoute<SettingsRoute>(
          path: '/settings',
        ),
      ],
    ),
    TypedStatefulShellBranch<ProfileBranch>(
      routes: <TypedGoRoute<GoRouteData>>[
        TypedGoRoute<ProfileRoute>(
          path: '/profile',
        ),
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

//* routes
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage();
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
