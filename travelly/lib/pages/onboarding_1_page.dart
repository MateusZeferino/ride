import 'package:flutter/material.dart';
import 'dart:async';

import 'onboarding_2_page.dart';

class Onboarding1Page extends StatefulWidget {
  const Onboarding1Page({super.key});

  static const routeName = '/onboarding-1';

  @override
  State<Onboarding1Page> createState() => _Onboarding1PageState();
}

class _Onboarding1PageState extends State<Onboarding1Page> {
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
    Navigator.of(context).pushReplacementNamed(Onboarding2Page.routeName);
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
          child: Image.asset('pages/Onboarding 1.png', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
