import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/menu_item.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int _selectedIndex = 0;
  String previousRoutePath = '';
  final menuItems = <MenuItem>[
    MenuItem(index: 0, name: 'Home', iconData: Icons.dashboard),
    MenuItem(index: 1, name: 'Settings', iconData: Icons.settings),
    MenuItem(index: 2, name: 'Profile', iconData: Icons.person),
    MenuItem(index: 3, name: 'App', iconData: Icons.app_shortcut)
  ];

  void _onTap(index) {
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
    // setState(() {
    //   _selectedIndex = index;
    // });
  }

  /// this function reads the routename, if is same as menu item, change state of selected index
  /// this will force menu to be selected
  void navigationUtils(BuildContext context) {
    String tmpPreviousRoutePath = '';

    final fullPath = GoRouterState.of(context).fullPath;

    final fullPathSplited = fullPath?.split('/') ?? [];

    // bellow snipped is responsible to select the right item on menu
    if (fullPathSplited.length >= 2) {
      final routeName = fullPathSplited[1];

      final routeIndex = menuItems
          .indexWhere((element) => element.name.toLowerCase() == routeName);

      if (routeIndex > -1) {
        setState(() {
          _selectedIndex = routeIndex;
        });
      }
    }

    // bellow snipped enable back button on subroutes, instead of drawer SMALL SCREENS ONLY
    if (fullPathSplited.length > 2) {
      final pos = fullPath?.lastIndexOf('/') ?? -1;
      if (pos > -1) {
        tmpPreviousRoutePath = fullPath!.substring(0, pos);
      }
    }
    setState(() {
      previousRoutePath = tmpPreviousRoutePath;
    });
  }

  // bellow snippet enable horizontal scroll if screen is less than minWidth
  // it should preferably be used on nested widget
  // Widget mainContent(BuildContext context) => Expanded(
  //         child: Container(
  //       color: Theme.of(context).colorScheme.surfaceVariant,
  //       child: Center(
  //           child: Scrollbar(
  //         controller: _scrollController,
  //         thumbVisibility: true,
  //         child: SingleChildScrollView(
  //           controller: _scrollController,
  //           scrollDirection: Axis.horizontal,
  //           child: ConstrainedBox(
  //               constraints:
  //                   const BoxConstraints(maxWidth: 1200, minWidth: 400),
  //               child: Container(
  //                   color: Theme.of(context).colorScheme.background,
  //                   child: widget.navigationShell)),
  //         ),
  //       )),
  //     ));
  @override
  Widget build(BuildContext context) {
    navigationUtils(context);
    final theme = Theme.of(context);
    final isSmallScreen = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    final curName = GoRouterState.of(context).fullPath?.split('/').last ?? '';

    return Scaffold(
      appBar: !isSmallScreen
          ? null
          : AppBar(
              leading: previousRoutePath.isEmpty
                  ? null
                  : BackButton(onPressed: () => context.go(previousRoutePath)),
              title: Row(
                children: [
                  Text(curName.toUpperCase()),
                ],
              ),
            ),
      drawer: !isSmallScreen
          ? null
          : Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(child: Container()),
                  ...menuItems.map((item) => ListTile(
                        leading: Icon(item.iconData),
                        title: Text(item.name),
                        onTap: () => _onTap(item.index),
                        selected: _selectedIndex == item.index,
                      )),
                ],
              ),
            ),
      body: Row(
        children: [
          if (!isSmallScreen)
            NavigationRail(
                selectedIndex: _selectedIndex,
                onDestinationSelected: _onTap,
                labelType: NavigationRailLabelType.selected,
                destinations: [
                  ...menuItems.map((item) => NavigationRailDestination(
                        icon: Icon(item.iconData),
                        selectedIcon: Icon(item.iconData),
                        label: Text(item.name),
                      )),
                ]),
          const VerticalDivider(),
          // This is the main content.
          Expanded(
              child: Container(
            color: theme.colorScheme.surfaceVariant,
            child: Center(
                child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxWidth: 1200, minWidth: 400),
                    child: Container(
                        color: theme.colorScheme.background,
                        child: widget.navigationShell))),
          ))
        ],
      ),
    );
  }
}
