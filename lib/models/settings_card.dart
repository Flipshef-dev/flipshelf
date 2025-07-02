import 'package:flutter/material.dart';

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