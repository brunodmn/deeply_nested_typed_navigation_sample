import 'package:flutter/material.dart';
import 'package:go_router_learn/core/contants.dart';

import '../routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> _loading() async {
    await Future.delayed(Durations.extralong4).then((value) {
      isLoggedIn
          ? const ProfileRoute().go(context)
          : const LoginRoute().go(context);
    });
  }

  @override
  void initState() {
    _loading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Loading'),
            Center(child: CircularProgressIndicator())
          ],
        ));
  }
}
