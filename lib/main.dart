import 'package:flutter/material.dart';
import 'package:flutter_imc_calculator/config/app_theme.dart';
import 'package:flutter_imc_calculator/screens/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const SplashScreen()
    );
  }
}
