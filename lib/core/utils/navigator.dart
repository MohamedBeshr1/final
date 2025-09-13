import 'package:e_commerce/features/Auth/data/Model/views/my_orders_screen.dart';
import 'package:e_commerce/features/onboarding/views/favorite_screen.dart';
import 'package:e_commerce/features/onboarding/views/my_profile_screen.dart';
import 'package:e_commerce/features/onboarding/views/settings_screen.dart';

import 'package:flutter/material.dart';

class NavigatorScreen extends StatelessWidget {
  final Function(String) onItemTapped; 

   NavigatorScreen({super.key, required this.onItemTapped});

  final List<Map<String, dynamic>> _menuItems = [
    {'title': 'My Profile', 'icon': 'assets/icons/Profile.png'},
    {'title': 'My Orders', 'icon': 'assets/icons/Bag - Iconly Pro (1).png'},
    {'title': 'My Favorites', 'icon': 'assets/icons/Heart - Iconly Pro (1).png'},
    {'title': 'Settings', 'icon': 'assets/icons/Setting - Iconly Pro.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _menuItems.length,
      itemBuilder: (context, index) {
        final item = _menuItems[index];
        final icon = item['icon'];
        final title = item['title'] as String;
        return ListTile(
          leading: icon is String
              ? Image.asset(
                  icon,
                  width: 24,
                  height: 24,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                )
              : Icon(icon as IconData? ?? Icons.error),
          title: Text(title),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            onItemTapped(title); 
            switch (title) {
              case 'My Profile':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  MyProfileScreen()),
                );
                break;
              case 'Settings':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
                break;
                case 'My Orders':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyOrdersScreen()),
                );
                break;
                case 'My Favorites':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoriteScreen()),
                );
                 break;
            }
          },
        );
      },
    );
  }
}