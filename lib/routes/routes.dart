import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../main.dart';
import '../pages/login_page.dart';
import '../pages/profile_page.dart';
import '../pages/splash_page.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(path: '/')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashPage();
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginPage();
}

@TypedGoRoute<ProfileRoute>(path: '/profile/:id')
class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ProfilePage(
        user: authRepo.currentUser!,
      );
}
