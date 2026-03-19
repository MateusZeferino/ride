import 'package:flutter/material.dart';

import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/splash_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const TravellyApp());
}

class TravellyApp extends StatelessWidget {
  const TravellyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travelly',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        SignupPage.routeName: (context) => const SignupPage(),
      },
    );
  }
}
