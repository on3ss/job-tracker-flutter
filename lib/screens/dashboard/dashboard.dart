import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:job_tracker_fl/widgets/custom_appbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Dashboard"),
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
