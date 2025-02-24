import 'package:flutter/material.dart';
import 'package:qr_scan_and_generate_app/view/generate_page.dart';
import 'package:qr_scan_and_generate_app/view/history.dart';
import 'package:qr_scan_and_generate_app/view/home_page.dart';

import 'view/setting.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/generate': (context) => GeneratePage(),
      '/history': (context) => HistoryPage(),
      '/settings': (context) => SettingWidget(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
