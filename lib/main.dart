import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unfold_news/core/theme.dart';
import 'package:unfold_news/home_page_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unfold News',
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      home: const HomePageController(),
    );
  }
}
