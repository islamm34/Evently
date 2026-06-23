import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/qora_button.dart';
import '../../../../core/widgets/qora_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: 'demo@qora.com');
    firstNameController = TextEditingController(text: 'John');
    lastNameController = TextEditingController(text: 'Doe');
    passwordController = TextEditingController(text: 'password123');
    confirmPasswordController = TextEditingController(text: 'password123');
  }

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                'Create Account',
                style: AppTextStyles.headingLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Join Qora today',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: isDark
                      ? AppColors.Dark.textSecondary
                      : AppColors.Light.textSecondary,
                ),
              ),
              const SizedBox(height: 40),
              QoraTextField(
                label: 'First Name',
                hint: 'Enter your first name',
                controller: firstNameController,
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              QoraTextField(
                label: 'Last Name',
                hint: 'Enter your last name',
                controller: lastNameController,
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              QoraTextField(
                label: 'Confirm Password',
                hint: 'Confirm your password',
                controller: confirmPasswordController,
                obscureText: obscurePassword,
                prefixIcon: Icons.lock_outline,
              ),
              const SizedBox(height: 24),
              QoraButton(
                label: 'Sign Up',
                onPressed: _navigateToDashboard,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isDark
                          ? AppColors.Dark.textSecondary
                          : AppColors.Light.textSecondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Text(
                      'Sign in',
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
