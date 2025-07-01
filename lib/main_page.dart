import 'package:flipshelf/pages/favorites/favorite_page.dart';
import 'package:flipshelf/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flipshelf/models/bottom_navbar_items.dart';
import 'package:flipshelf/pages/home/home_page.dart';
import 'package:flipshelf/pages/search/search_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    FavoritePage(),
    SettingsPage(),
  ];

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(18),
          //   topRight: Radius.circular(18),
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            color: Theme.of(context).colorScheme.secondary,
            activeColor: Theme.of(context).colorScheme.secondary,
            tabBackgroundColor: Theme.of(context).colorScheme.primary,
            rippleColor: Theme.of(context).colorScheme.primary,
            gap: 8,
            padding: EdgeInsets.all(16),
            onTabChange: (index) {
              _onNavTap(index);
            },
            iconSize: 22,
            duration: Duration(milliseconds: 400),
            tabs: [
              GButton(
                icon: LucideIcons.home,
                text: "Home",
                textColor: Theme.of(context).colorScheme.tertiary,
                iconActiveColor: Theme.of(context).colorScheme.tertiary,
              ),
              GButton(
                icon: LucideIcons.search,
                text: "Search",
                textColor: Theme.of(context).colorScheme.tertiary,
                iconActiveColor: Theme.of(context).colorScheme.tertiary,
              ),
              GButton(
                icon: LucideIcons.heart,
                text: "Fav",
                textColor: Theme.of(context).colorScheme.tertiary,
                iconActiveColor: Theme.of(context).colorScheme.tertiary,
              ),
              GButton(
                icon: LucideIcons.settings,
                text: "Settings",
                textColor: Theme.of(context).colorScheme.tertiary,
                iconActiveColor: Theme.of(context).colorScheme.tertiary,
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: nav(context),
    );
  }

  Container nav(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 12, offset: Offset(0, 4)),
        ],
      ),
      // Nav icons
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navIcons.asMap().entries.map((entry) {
          int index = entry.key;
          IconData icon = entry.value;
          bool isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () => _onNavTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
              ),
              child: Icon(
                icon,
                size: 22,
                color: isSelected
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.onSurface.withAlpha(100),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
