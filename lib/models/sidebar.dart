import 'package:flipshelf/models/sidebar_card.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 28),
            buildTopBar(context),
            SizedBox(height: 20),
            buildNavs(context),
          ],
        ),
      ),
    );
  }

  Widget buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton.filledTonal(
          icon: Icon(LucideIcons.chevronLeft),
          style: IconButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.secondary,
          ),
          iconSize: 32,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Text(
          "Menu",
          style: TextStyle(
            fontSize: 28,
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }

  Widget buildNavs(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        spacing: 22,
        children: [
          SidebarCard(
            title: "Profile",
            subtitle: "User details",
            icons: LucideIcons.user2,
            onClick: () {},
          ),
          SidebarCard(
            title: "Language",
            subtitle: "Change language",
            icons: LucideIcons.globe,
            onClick: () {},
          ),
          SidebarCard(
            title: "Settings",
            subtitle: "Go to settings",
            icons: LucideIcons.settings,
            onClick: () {},
          ),
        ],
      ),
    );
  }
}
