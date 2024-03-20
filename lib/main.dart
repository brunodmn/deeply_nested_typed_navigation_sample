import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'data/repository/auth_repo.dart';
import 'routes/pages.dart';

final authRepo = AuthRepo();
void main() {
  usePathUrlStrategy();
  authRepo.authStateChanges.listen(
    (user) {
      router.refresh();
    },
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "ISPJet",
      routerConfig: router,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 575, name: MOBILE),
          const Breakpoint(start: 576, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
