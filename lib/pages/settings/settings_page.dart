import 'package:flipshelf/models/settings_card.dart';
import 'package:flipshelf/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Topbar
            _buildTopBar(context),
            // Content
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Settings",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          // IconButton(
          // onPressed: (){},
          // icon: Icon(Icons.more_vert_rounded),
          // ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildAccountSettings(context),
                  SizedBox(height: 20),
                  _buildSettings(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSettings(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, left: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(150),
            blurRadius: 8,
            offset: const Offset(0, 0.2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Accounts',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          settingsCard(
            context: context,
            mainIcon: LucideIcons.userCircle,
            secondaryIcon: LucideIcons.chevronRight,
            title: "Username",
            subtitle: "Personal details",
            onTap: () {},
          ),
          settingsCard(
            context: context,
            mainIcon: LucideIcons.lock,
            secondaryIcon: LucideIcons.chevronRight,
            title: "Password and Security",
            subtitle: "Personal password",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSettings(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return Container(
      padding: EdgeInsets.only(top: 12, left: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(150),
            blurRadius: 8,
            offset: const Offset(0, 0.2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Settings',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          settingsCard(
            context: context,
            mainIcon: LucideIcons.globe,
            secondaryIcon: LucideIcons.chevronRight,
            title: "Language",
            subtitle: "English",
            onTap: () {},
          ),
          settingsCard(
            context: context,
            mainIcon: LucideIcons.moon,
            secondaryIcon: themeProvider.isDarkMode
                ? LucideIcons.moon
                : LucideIcons.sun,
            title: "Dark mood",
            subtitle: "Change theme",
            onTap: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
