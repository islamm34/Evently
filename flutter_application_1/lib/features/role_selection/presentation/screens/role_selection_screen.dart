import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/qora_button.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                'Choose your role to get started',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: isDark
                      ? AppColors.Dark.textSecondary
                      : AppColors.Light.textSecondary,
                ),
              ),
              const SizedBox(height: 48),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Service Seeker Card
                    _buildRoleCard(
                      context,
                      icon: Icons.person_search,
                      title: 'Service Seeker',
                      description:
                          'Find businesses, reserve queue tickets, and track your turn in real-time.',
                      onTap: () => context.push('/login'),
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: 24),
                    // Service Provider Card
                    _buildRoleCard(
                      context,
                      icon: Icons.business,
                      title: 'Service Provider',
                      description:
                          'Manage queues, staff, and serve customers more efficiently.',
                      onTap: () => context.push('/login'),
                      color: AppColors.accent,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'New to Qora? ',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isDark
                          ? AppColors.Dark.textSecondary
                          : AppColors.Light.textSecondary,
                    ),
                    children: [
                      TextSpan(
                        text: 'Create account',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.push('/register'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
    required Color color,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isDark ? AppColors.Dark.card : AppColors.Light.card,
          border: Border.all(
            color: isDark ? AppColors.Dark.border : AppColors.Light.border,
            width: 1.5,
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 32,
                color: color,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: AppTextStyles.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark
                    ? AppColors.Dark.textSecondary
                    : AppColors.Light.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: QoraButton(
                label: 'Continue',
                onPressed: onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
