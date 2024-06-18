import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(
        title,
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
