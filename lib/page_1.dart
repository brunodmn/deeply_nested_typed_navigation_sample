import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_learn/routes/routes.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            FilledButton(
                onPressed: () => context.go(Routes.page1 + '/' + Routes.page2),
                child: Text('see details')),
            Center(
              child: Container(child: Text('Page1')),
            ),
          ],
        ));
  }
}
