import 'package:flutter/material.dart';
import 'dart:async';
import '../../../constants/image_constants.dart';
import '../../../constants/text_constants.dart';
import '../../themes/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logoSquare),
            const SizedBox(height: 20),
            const Text(
              AppText.welcomeMessage,
              style: TextStyle(
                fontSize: 24,
                color: AppColor.color93287f,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
