import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SidebarCard extends StatelessWidget {
  final String title;
  final IconData icons;
  final Function onClick;
  final String subtitle;
  const SidebarCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icons,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icons,
              color: Theme.of(context).colorScheme.secondary,
              size: 28,
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: onClick(),
          icon: Icon(LucideIcons.chevronRight),
          color: Theme.of(context).colorScheme.secondary,
          iconSize: 28,
        ),
      ],
    );
  }
}
