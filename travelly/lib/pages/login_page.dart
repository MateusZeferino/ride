import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_theme.dart';
import 'home_page.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool stayConnected = false;
  bool obscurePassword = true;

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
                      const SizedBox(height: 76),
                      Text('TRAVELLY', style: textTheme.headlineMedium),
                      const SizedBox(height: 64),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Nome de usuario ou email',
                        ),
                      ),
                      const SizedBox(height: 14),
                      TextField(
                        obscureText: obscurePassword,
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(
                                () => obscurePassword = !obscurePassword,
                              );
                            },
                            icon: Icon(
                              obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _TinyCheck(
                            value: rememberMe,
                            onChanged: (value) =>
                                setState(() => rememberMe = value),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Lembrar-me',
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColors.textMuted,
                              fontSize: 27 / 2,
                            ),
                          ),
                          const SizedBox(height: 36),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              'Esqueci minha senha',
                              style: textTheme.bodyMedium?.copyWith(
                                color: AppColors.textMuted,
                                fontSize: 27 / 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _TinyCheck(
                            value: stayConnected,
                            onChanged: (value) =>
                                setState(() => stayConnected = value),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Permanecer conectado?',
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColors.textMuted,
                              fontSize: 27 / 2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      _PrimaryButton(
                        text: 'LOGIN',
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(
                            HomePage.routeName,
                          );
                        },
                      ),
                      const SizedBox(height: 42),
                      Text(
                        'Nao possui conta ainda?',
                        style: textTheme.titleLarge?.copyWith(fontSize: 46 / 2),
                      ),
                      const SizedBox(height: 10),
                      _SecondaryButton(
                        text: 'CADASTRE-SE',
                        onPressed: () {
                          Navigator.of(context).pushNamed(SignupPage.routeName);
                        },
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

class _TinyCheck extends StatelessWidget {
  const _TinyCheck({required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: Checkbox(
        value: value,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        onChanged: (newValue) => onChanged(newValue ?? false),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.bebasNeue(
            color: Colors.white,
            fontSize: 43 / 2,
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  const _SecondaryButton({required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.bebasNeue(
            color: Colors.white,
            fontSize: 31 / 2,
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
  }
}
