import 'package:flutter/material.dart';
import 'package:sartha/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:sartha/presentation/screens/login/sign_in_view.dart';
import 'package:sartha/presentation/screens/login/view.dart';
import 'package:sartha/presentation/screens/onboarding/view.dart';
import 'package:sartha/presentation/screens/registration/view.dart';
import 'package:sartha/presentation/screens/splash/view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LogInScreen());
      case '/signIn':
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegistrationPage());
      case '/forgotPassword':
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}