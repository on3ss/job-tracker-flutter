import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    super.key,
    required this.navigationShell,
  });

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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        unselectedItemColor:
            Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        useLegacyColorScheme: false,
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(
              context,
              FeatherIcons.grid,
              navigationShell.currentIndex == 0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
              context,
              FeatherIcons.calendar,
              navigationShell.currentIndex == 1,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
              context,
              FeatherIcons.briefcase,
              navigationShell.currentIndex == 2,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
              context,
              FeatherIcons.sliders,
              navigationShell.currentIndex == 3,
            ),
            label: '',
          ),
        ],
        onTap: _goBranch,
      ),
    );
  }

  Widget _buildIcon(BuildContext context, IconData iconData, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
              : Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Icon(iconData),
    );
  }
}
