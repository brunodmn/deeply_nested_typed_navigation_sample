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
  bool showBackButton = false;
  String pageName = '';
  bool isDrawerOpened = false;
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
    if (isDrawerOpened) {
      context.pop();
    }
  }

  /// this function reads the routename, if is same as menu item, change state of selected index
  /// this will force menu to be selected
  void navigationUtils(BuildContext context) {
    final fullPath =
        GoRouterState.of(context).fullPath ?? '/'; // i.e. /home/app/:id
    final topRoute =
        GoRouterState.of(context).topRoute?.path ?? ''; // i.e. app/:id

    // finds parent route, if any, to navegate to it, instead of poping the rroute stack
    setState(() {
      showBackButton = fullPath != topRoute;
      previousRoutePath = fullPath.replaceFirst('/$topRoute', '');
    });

    // separates the path into strings, i.i '/home/app/:id' becomes ['home', 'app']
    final fullPathSplited = fullPath
        .split('/')
        .where((element) => element.isNotEmpty && !element.startsWith(':'))
        .toList();

    // bellow snipped is responsible to select the right item on menu
    if (fullPathSplited.isNotEmpty) {
      // sets the page name, last item on array, params are excluded
      setState(() {
        pageName = fullPathSplited.last;
      });

      final routeIndex = menuItems.indexWhere(
          (element) => element.name.toLowerCase() == fullPathSplited[0]);
      if (routeIndex > -1) {
        setState(() {
          _selectedIndex = routeIndex;
        });
      }
    }
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

    return Scaffold(
      appBar: !isSmallScreen
          ? null
          : AppBar(
              leading: showBackButton
                  ? BackButton(onPressed: () => context.go(previousRoutePath))
                  : null,
              title: Row(
                children: [
                  Text(pageName.toUpperCase()),
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
      // callback used to close drawer on item tap
      onDrawerChanged: (isOpened) => setState(() {
        isDrawerOpened = isOpened;
      }),
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
