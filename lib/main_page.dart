import 'package:flipshelf/pages/favorites/favorite_page.dart';
import 'package:flipshelf/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flipshelf/models/bottom_navbar_items.dart';
import 'package:flipshelf/pages/home/home_page.dart';
import 'package:flipshelf/pages/search/search_page.dart';

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
        height: 70,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(100),
              spreadRadius: 0,
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
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
      ),
    );
  }
}