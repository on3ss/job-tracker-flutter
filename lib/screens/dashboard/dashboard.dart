import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Dashboard',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
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
      body: SafeArea(
        child: Center(
          child: Text(
            'Dashboard',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  IconData getThemeSwitchIcon(AdaptiveThemeMode mode) {
    switch (mode) {
      case AdaptiveThemeMode.light:
        return FeatherIcons.moon;
      case AdaptiveThemeMode.dark:
        return FeatherIcons.smartphone;
      default:
        return Icons.sunny;
    }
  }
}
