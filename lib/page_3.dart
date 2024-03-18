import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page3 extends StatelessWidget {
  const Page3(
    this.navigationShell, {
    super.key,
  });

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;
  void _onTap(index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onTap,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: '1'),
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: '2'),
          ],
        ),
        body: navigationShell);
  }
}
