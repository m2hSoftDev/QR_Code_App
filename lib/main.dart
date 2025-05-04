import 'package:flutter/material.dart';
import 'package:qr_scan_and_generate_app/view/generate_page.dart';
import 'package:qr_scan_and_generate_app/view/history.dart';
import 'package:qr_scan_and_generate_app/view/splash.dart';

import 'view/home_page.dart';
import 'view/result_page.dart';
import 'view/setting.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context)=> SplashView(),
      '/home': (context) => HomePage(),
      '/generate': (context) => GeneratePage(),
      '/history': (context) => HistoryPage(),
      '/settings': (context) => SettingWidget(),
    },
  ));
}


