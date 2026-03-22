import 'package:flutter/material.dart';
import 'onboarding_2_page.dart';

class Onboarding1Page extends StatelessWidget {
  const Onboarding1Page({super.key});

  static const routeName = '/onboarding-1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context).pushReplacementNamed(Onboarding2Page.routeName);
        },
        child: SizedBox.expand(
          child: Image.asset(
            'pages/Onboarding 1.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
