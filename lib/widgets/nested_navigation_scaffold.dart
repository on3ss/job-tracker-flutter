import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationShell.currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        useLegacyColorScheme: false,
        selectedIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
          size: 26,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.grid),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.calendar),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.briefcase),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.sliders),
            label: '',
          ),
        ],
        onTap: _goBranch,
      ),
    );
  }
}
