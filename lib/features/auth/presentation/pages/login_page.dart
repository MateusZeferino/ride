import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../core/widgets/app_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscure = true;
  bool _rememberMe = false;
  bool _stayConnected = false;

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text('TRAVELLY', style: AppTextStyles.brand),
                  const SizedBox(height: 42),
                  AppTextField(
                    controller: _userController,
                    hintText: 'Nome de usuario ou email',
                  ),
                  const SizedBox(height: 14),
                  AppTextField(
                    controller: _passwordController,
                    hintText: 'Senha',
                    obscureText: _obscure,
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => _obscure = !_obscure),
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Checkbox(
                                value: _rememberMe,
                                activeColor: AppColors.primary,
                                side: const BorderSide(color: AppColors.primary),
                                onChanged: (value) {
                                  setState(() => _rememberMe = value ?? false);
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text('Lembrar-me', style: AppTextStyles.footer),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Esqueci minha senha',
                          style: AppTextStyles.footer,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Checkbox(
                          value: _stayConnected,
                          activeColor: AppColors.primary,
                          side: const BorderSide(color: AppColors.primary),
                          onChanged: (value) {
                            setState(() => _stayConnected = value ?? false);
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Permanecer conectado?',
                        style: AppTextStyles.footer,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: 240,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('LOGIN', style: AppTextStyles.button),
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Text('Nao possui conta ainda?', style: AppTextStyles.body),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 200,
                    height: 42,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteNames.register);
                      },
                      child: const Text(
                        'CADASTRE-SE',
                        style: AppTextStyles.button,
                      ),
                    ),
                  ),
                  const SizedBox(height: 110),
                  const Text(
                    'Travelly All Rights Reserved',
                    style: AppTextStyles.footer,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
