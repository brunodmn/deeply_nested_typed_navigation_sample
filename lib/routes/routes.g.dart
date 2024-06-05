// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashRoute,
      $homeShellRoute,
    ];

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeShellRoute => StatefulShellRouteData.$route(
      factory: $HomeShellRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/home',
              factory: $HomeRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/settings',
              factory: $SettingsRouteExtension._fromState,
              routes: [
                StatefulShellRouteData.$route(
                  factory: $SettingsShellRouteExtension._fromState,
                  branches: [
                    StatefulShellBranchData.$branch(
                      routes: [
                        GoRouteData.$route(
                          path: 'general',
                          factory: $GeneralRouteExtension._fromState,
                        ),
                      ],
                    ),
                    StatefulShellBranchData.$branch(
                      routes: [
                        GoRouteData.$route(
                          path: 'billing',
                          factory: $BillingRouteExtension._fromState,
                        ),
                      ],
                    ),
                    StatefulShellBranchData.$branch(
                      routes: [
                        GoRouteData.$route(
                          path: 'notifications',
                          factory: $NotificationsRouteExtension._fromState,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/apps',
              factory: $AppsRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: ':id',
                  factory: $AppRouteExtension._fromState,
                  routes: [
                    StatefulShellRouteData.$route(
                      factory: $AppShellRouteExtension._fromState,
                      branches: [
                        StatefulShellBranchData.$branch(
                          routes: [
                            GoRouteData.$route(
                              path: 'general',
                              factory: $AppGeneralRouteExtension._fromState,
                            ),
                          ],
                        ),
                        StatefulShellBranchData.$branch(
                          routes: [
                            GoRouteData.$route(
                              path: 'support',
                              factory: $AppSupportRouteExtension._fromState,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $HomeShellRouteExtension on HomeShellRoute {
  static HomeShellRoute _fromState(GoRouterState state) =>
      const HomeShellRoute();
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsShellRouteExtension on SettingsShellRoute {
  static SettingsShellRoute _fromState(GoRouterState state) =>
      const SettingsShellRoute();
}

extension $GeneralRouteExtension on GeneralRoute {
  static GeneralRoute _fromState(GoRouterState state) => const GeneralRoute();

  String get location => GoRouteData.$location(
        '/settings/general',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BillingRouteExtension on BillingRoute {
  static BillingRoute _fromState(GoRouterState state) => const BillingRoute();

  String get location => GoRouteData.$location(
        '/settings/billing',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NotificationsRouteExtension on NotificationsRoute {
  static NotificationsRoute _fromState(GoRouterState state) =>
      const NotificationsRoute();

  String get location => GoRouteData.$location(
        '/settings/notifications',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AppsRouteExtension on AppsRoute {
  static AppsRoute _fromState(GoRouterState state) => const AppsRoute();

  String get location => GoRouteData.$location(
        '/apps',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AppRouteExtension on AppRoute {
  static AppRoute _fromState(GoRouterState state) => AppRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/apps/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AppShellRouteExtension on AppShellRoute {
  static AppShellRoute _fromState(GoRouterState state) => const AppShellRoute();
}

extension $AppGeneralRouteExtension on AppGeneralRoute {
  static AppGeneralRoute _fromState(GoRouterState state) => AppGeneralRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/apps/${Uri.encodeComponent(id)}/general',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AppSupportRouteExtension on AppSupportRoute {
  static AppSupportRoute _fromState(GoRouterState state) => AppSupportRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/apps/${Uri.encodeComponent(id)}/support',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
