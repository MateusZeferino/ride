import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/onboarding_1_page.dart';
import 'pages/onboarding_2_page.dart';
import 'pages/onboarding_3_page.dart';
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
        Onboarding1Page.routeName: (context) => const Onboarding1Page(),
        Onboarding2Page.routeName: (context) => const Onboarding2Page(),
        Onboarding3Page.routeName: (context) => const Onboarding3Page(),
        LoginPage.routeName: (context) => const LoginPage(),
        SignupPage.routeName: (context) => const SignupPage(),
        HomePage.routeName: (context) => const HomePage(),
      },
    );
  }
}
