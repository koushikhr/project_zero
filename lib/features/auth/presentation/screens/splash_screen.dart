import 'package:flutter/material.dart';
import 'package:project_zero/core/constants/app_colors.dart';
import 'package:project_zero/core/constants/assets.dart';
import 'package:project_zero/features/auth/presentation/widgets/auth_gradient.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthGradient(
        child: Center(
          child: Image(
            image: AssetImage(Assets.logoWhite),
            width: 150,
          ),
        ),
      ),
    );
  }
}