import 'package:flutter/material.dart';

Widget customRow(String title, String subtitle, Icon icon) {
  final Color primaryColor = Color(0xFF212121);
  final Color secondaryBackground = Color.fromARGB(255, 109, 108, 108);
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Inter Tight',
              letterSpacing: 0.0,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              letterSpacing: 0.0,
            ),
          ),
        ],
      ),
      Icon(
        icon.icon,
        color: primaryColor,
        size: 28,
      ),
    ],
  );
}
