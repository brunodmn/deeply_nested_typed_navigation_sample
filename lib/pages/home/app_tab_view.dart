import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppTabPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppTabPage({super.key, required this.navigationShell});
  void _onTap(index) {
    print('navigationShell.goBranch : ${navigationShell.currentIndex}');
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
    // setState(() {
    //   _selectedIndex = index;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              onTap: (index) => _onTap(index),
              tabs: const [
                Tab(icon: Icon(Icons.flight)),
                Tab(icon: Icon(Icons.directions_transit)),
                // Tab(icon: Icon(Icons.directions_car)),
              ],
            ),
            title: const Text('Tabs Demo'),
          ),
          body: navigationShell),
    );
  }
}
