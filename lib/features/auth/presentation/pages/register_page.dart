import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../core/widgets/app_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.primary,
                        size: 28,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('TRAVELLY', style: AppTextStyles.brand),
                  const SizedBox(height: 42),
                  AppTextField(
                    controller: _userController,
                    hintText: 'Nome de usuario',
                  ),
                  const SizedBox(height: 14),
                  AppTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 14),
                  AppTextField(
                    controller: _passwordController,
                    hintText: 'Senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 14),
                  AppTextField(
                    controller: _confirmController,
                    hintText: 'Confirme a sua senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 28),
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
                      child: const Text('CADASTRAR', style: AppTextStyles.button),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text('Ja possui conta?', style: AppTextStyles.body),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 160,
                    height: 42,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('LOGIN', style: AppTextStyles.button),
                    ),
                  ),
                  const SizedBox(height: 72),
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
