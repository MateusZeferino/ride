import 'package:flutter/material.dart';
import 'dart:async';

import 'onboarding_3_page.dart';

class Onboarding2Page extends StatefulWidget {
  const Onboarding2Page({super.key});

  static const routeName = '/onboarding-2';

  @override
  State<Onboarding2Page> createState() => _Onboarding2PageState();
}

class _Onboarding2PageState extends State<Onboarding2Page> {
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
    Navigator.of(context).pushReplacementNamed(Onboarding3Page.routeName);
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
          child: Image.asset('pages/Onboarding 2.png', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
