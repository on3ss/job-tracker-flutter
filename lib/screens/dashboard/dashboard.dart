import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Dashboard'),
        actions: [
          ValueListenableBuilder(
            valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
            builder: (_, mode, __) => IconButton(
              onPressed: () => AdaptiveTheme.of(context).toggleThemeMode(),
              icon: Icon(getThemeSwitchIcon(mode)),
            ),
          ),
        ],
      ),
      body: const SafeArea(
        child: Center(
          child: Text('Dashboard'),
        ),
      ),
    );
  }

  IconData getThemeSwitchIcon(AdaptiveThemeMode mode) {
    switch (mode) {
      case AdaptiveThemeMode.light:
        return Icons.dark_mode_rounded;
      case AdaptiveThemeMode.dark:
        return Icons.settings_system_daydream_rounded;
      default:
        return Icons.light_mode_rounded;
    }
  }
}
