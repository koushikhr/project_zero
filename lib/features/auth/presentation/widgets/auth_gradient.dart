import 'package:flutter/material.dart';
import 'package:project_zero/core/constants/app_colors.dart';

class AuthGradient extends StatelessWidget {
  final Widget child;

  const AuthGradient({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}