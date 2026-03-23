import 'package:flutter/material.dart';
import 'dart:async';

import 'login_page.dart';

class Onboarding3Page extends StatefulWidget {
  const Onboarding3Page({super.key});

  static const routeName = '/onboarding-3';

  @override
  State<Onboarding3Page> createState() => _Onboarding3PageState();
}

class _Onboarding3PageState extends State<Onboarding3Page> {
  Timer? _timer;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 1), _goNext);
  }

  void _goNext() {
    if (_navigated || !mounted) return;
    _navigated = true;
    Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _goNext,
        child: SizedBox.expand(
          child: Image.asset('pages/Onboarding 3.png', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
