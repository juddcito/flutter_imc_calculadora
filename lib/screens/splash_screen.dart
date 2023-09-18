

import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_imc_calculator/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000),
    () => Navigator.pushReplacement(context, MaterialPageRoute(
      builder:(context) => FadeIn(
        duration: Duration(milliseconds: 900),
        child: const HomeScreen()
        ),
      ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Image.asset(
              'assets/imc_icon.png',
              scale: 2,
            ),

            const SizedBox(height: 15),
            
            const CircularProgressIndicator(
              color: Colors.black,
            )
          ],
        ),
      )
    );
  }
}