import 'package:flutter/material.dart';
import 'onboarding_3_page.dart';

class Onboarding2Page extends StatelessWidget {
  const Onboarding2Page({super.key});

  static const routeName = '/onboarding-2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context).pushReplacementNamed(Onboarding3Page.routeName);
        },
        child: SizedBox.expand(
          child: Image.asset(
            'pages/Onboarding 2.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
