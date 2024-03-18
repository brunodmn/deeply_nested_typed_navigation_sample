import 'package:flutter/material.dart';
import 'data/repository/auth_repo.dart';
import 'routes/pages.dart';

final authRepo = AuthRepo();
void main() {
  authRepo.authStateChanges.listen(
    (user) {
      print('user state chnages');
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
      routerConfig: router,
    );
  }
}
