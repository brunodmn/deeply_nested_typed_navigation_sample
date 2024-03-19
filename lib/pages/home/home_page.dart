import 'package:flutter/material.dart';
import 'package:go_router_learn/pages/home/profile_page.dart';
import 'package:go_router_learn/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          color: Colors.red,
        ),
        ElevatedButton(
            onPressed: () {
              ApplicationsRoute().go(context);
            },
            child: Text('go')),
        const Text(
          '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111',
          maxLines: 1,
        ),
        const Text('Home'),
      ],
    );
  }
}
