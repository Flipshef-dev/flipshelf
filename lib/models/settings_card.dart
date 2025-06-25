import 'package:flipshelf/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

Widget settingsCard({
  required BuildContext context,
  required IconData mainIcon,
  required IconData secondaryIcon,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return Container(
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        child: Icon(
          mainIcon,
          color: Theme.of(context).colorScheme.secondary,
          size: 32,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.secondary.withAlpha(160),
        ),
      ),
      trailing: IconButton(
        onPressed: onTap,
        icon: Icon(secondaryIcon),
        color: Theme.of(context).colorScheme.secondary,
      ),
    ),
  );
}

Widget settingsCardWithSwitch({
  required BuildContext context,
  required IconData icon,
  required String title,
  required bool value,
  // required ValueChanged<bool> onChanged,
}) {
  final themeProvider = context.watch<ThemeProvider>();
  return Container(
    margin: EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Icon(icon, color: Colors.white70, size: 32),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: LiteRollingSwitch(
        width: 100,
        value: themeProvider.isDarkMode,
        iconOn: LucideIcons.moon,
        iconOff: LucideIcons.sun,
        textOn: "",
        textOff: "",
        textSize: 0,
        colorOn: Theme.of(context).colorScheme.surface,

        onTap: (bool value) {
          themeProvider.toggleTheme();
        },
        onChanged: (bool value) {
          themeProvider.toggleTheme();
        },
        onSwipe: (bool value) {
          themeProvider.toggleTheme();
        },
        onDoubleTap: () {},
      ),
    ),
  );
}
