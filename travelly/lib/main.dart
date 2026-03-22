import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/onboarding_1_page.dart';
import 'pages/onboarding_2_page.dart';
import 'pages/onboarding_3_page.dart';
import 'pages/signup_page.dart';
import 'pages/splash_page.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // NOTE: The key provided here is the service_role key.
  // In a production app, you MUST use the anon public key instead.
  await Supabase.initialize(
    url: 'https://eniaadtmoyiivutpoxfm.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVuaWFhZHRtb3lpaXZ1dHBveGZtIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3Mzc4NTE1NCwiZXhwIjoyMDg5MzYxMTU0fQ.CfTdeOjsgLrohUoLvSb6n4pEkMDsL2NGbBQJ9TBqsAk',
  );

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
