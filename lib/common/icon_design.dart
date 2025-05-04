import 'package:flutter/material.dart';


Widget WebsiteIconWidget(
    BuildContext context, Icon icon, String title, Function ontap) {
  const _whiteBorder = BorderSide(color: Colors.white, width: 2);
  const _textStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
  return InkWell(
    onTap: () {
      ontap();
    },
    child: Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                border: Border.all(style: _whiteBorder.style),
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffffffff)),
            child: Icon(
              icon.icon,
              size: 30,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                title,
                style: _textStyle.copyWith(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
// }
