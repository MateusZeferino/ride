import 'package:flutter/material.dart';
import 'login_page.dart';

class Onboarding3Page extends StatelessWidget {
  const Onboarding3Page({super.key});

  static const routeName = '/onboarding-3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
        },
        child: SizedBox.expand(
          child: Image.asset(
            'pages/Onboarding 3.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
