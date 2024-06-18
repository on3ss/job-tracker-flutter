import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 1,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      actions: [
        ValueListenableBuilder(
          valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
          builder: (_, mode, __) => IconButton(
            onPressed: () =>
                AdaptiveTheme.of(context).toggleThemeMode(useSystem: false),
            icon: Icon(getThemeSwitchIcon(mode)),
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  IconData getThemeSwitchIcon(AdaptiveThemeMode mode) {
    if (mode == AdaptiveThemeMode.light) {
      return HeroIcons.moon;
    }
    return HeroIcons.sun;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
