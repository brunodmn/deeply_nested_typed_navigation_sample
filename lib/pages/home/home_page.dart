import 'package:flutter/material.dart';
import '../../routes/routes.dart';

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
              const ApplicationsRoute().go(context);
            },
            child: const Text('go')),
        const Text(
          '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111',
          maxLines: 1,
        ),
        const Text('Home'),
      ],
    );
  }
}
