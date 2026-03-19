import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_theme.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  static const routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 42),
                      Text('TRAVELLY', style: textTheme.headlineMedium),
                      const SizedBox(height: 54),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Nome de usuario',
                        ),
                      ),
                      const SizedBox(height: 14),
                      const TextField(
                        decoration: InputDecoration(hintText: 'Email'),
                      ),
                      const SizedBox(height: 14),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Senha'),
                      ),
                      const SizedBox(height: 14),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Confirme a sua senha',
                        ),
                      ),
                      const SizedBox(height: 44),
                      SizedBox(
                        width: 240,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'CADASTRAR',
                            style: GoogleFonts.bebasNeue(
                              color: Colors.white,
                              fontSize: 43 / 2,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 44),
                      Text(
                        'Ja possui conta?',
                        style: textTheme.titleLarge?.copyWith(fontSize: 46 / 2),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 190,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'LOGIN',
                            style: GoogleFonts.bebasNeue(
                              color: Colors.white,
                              fontSize: 31 / 2,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 18),
                        child: Text(
                          'Travelly All Rights Reserved',
                          style: GoogleFonts.oswald(
                            color: AppColors.textMuted,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
