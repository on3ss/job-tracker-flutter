import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_rounded), label: ''),
          NavigationDestination(icon: Icon(Icons.timeline_rounded), label: ''),
          NavigationDestination(icon: Icon(Icons.task_rounded), label: ''),
          NavigationDestination(icon: Icon(Icons.more_vert_rounded), label: ''),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
