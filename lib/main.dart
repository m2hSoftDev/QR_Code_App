import 'package:flutter/material.dart';
import 'package:qr_scan_and_generate_app/view/home_page.dart';
import 'package:qr_scan_and_generate_app/view/setting.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingWidget();
  }
}
