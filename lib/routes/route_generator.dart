import 'package:flutter/material.dart';
import 'package:project_zero/features/auth/presentation/screens/login_screen.dart';
import 'package:project_zero/features/auth/presentation/screens/register_screen.dart';
import 'package:project_zero/features/home/presentation/screens/home_screen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginScreen(),
          transitionsBuilder: (_, animation, __, child) {
            final offset =
                settings.arguments == 'fromRegister'
                    ? const Offset(-1, 0)
                    : const Offset(0, 1);

            return SlideTransition(
              position: animation.drive(
                Tween<Offset>(
                  begin: offset,
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeInOutCubic)),
              ),
              child: child,
            );
          },
        );
      case AppRoutes.register:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const RegisterScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: animation.drive(
                Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeInOutCubic)),
              ),
              child: child,
            );
          },
        );
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
