import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/qora_button.dart';
import '../../../../core/widgets/qora_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: 'demo@qora.com');
    passwordController = TextEditingController(text: 'password123');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _navigateToDashboard() {
    context.go('/customer/home');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                'Welcome to Qora',
                style: AppTextStyles.headingLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to your account',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: isDark
                      ? AppColors.Dark.textSecondary
                      : AppColors.Light.textSecondary,
                ),
              ),
              const SizedBox(height: 40),
              QoraTextField(
                label: 'Email',
                hint: 'Enter your email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),
              QoraTextField(
                label: 'Password',
                hint: 'Enter your password',
                controller: passwordController,
                obscureText: obscurePassword,
                prefixIcon: Icons.lock_outline,
                suffixIcon: obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                onSuffixIconPressed: () {
                  setState(() => obscurePassword = !obscurePassword);
                },
              ),
              const SizedBox(height: 24),
              QoraButton(
                label: 'Sign In',
                onPressed: _navigateToDashboard,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isDark
                          ? AppColors.Dark.textSecondary
                          : AppColors.Light.textSecondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.push('/register'),
                    child: Text(
                      'Sign up',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
