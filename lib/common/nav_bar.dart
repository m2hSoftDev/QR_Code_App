 import 'package:flutter/material.dart';

import '../view/home_page.dart';

Widget buildBottomNavigation(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavItem( context, Icons.qr_code_scanner, 'Scan', HomePage.route),
          buildNavItem(context, Icons.qr_code, 'Generate', '/generate'),
          buildNavItem(context, Icons.history, 'History', '/history'),
          buildNavItem(context, Icons.settings, 'Settings', '/settings'),
        ],
      ),
    );
  }

  Widget buildNavItem(
      BuildContext context, IconData icon, String label, String route) {
        
  // Define your color scheme (replace with actual colors from your design)
   const Color primaryColor = Color(0xFF2196F3); // Example blue
   const Color primaryTextColor = Color(0xFF212121);
   const Color secondaryTextColor = Color(0xFF757575);
   const Color backgroundColor = Color(0xFFFFFFFF);
    return InkWell(
      onTap: () {
        if (route.isEmpty || ModalRoute.of(context)?.settings.name == route) {
          return; // Prevent navigation if route is empty or already on the page
        }
        Navigator.pushNamed(context, route);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: primaryColor, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }