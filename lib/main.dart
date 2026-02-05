import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/screens/home_screen.dart';
import 'business_logic/game_controller.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const HomeScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(GameController());
      }),
    );
  }
}
