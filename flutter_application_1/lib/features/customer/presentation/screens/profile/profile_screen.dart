import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/qora_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: AppTextStyles.headingMedium),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary.withOpacity(0.1),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'John Doe',
                    style: AppTextStyles.headingMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'john@example.com',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isDark
                          ? AppColors.Dark.textSecondary
                          : AppColors.Light.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // Account Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account',
                    style: AppTextStyles.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  _buildProfileOption(
                    context,
                    icon: Icons.person_outline,
                    title: 'Edit Profile',
                    subtitle: 'Update your personal information',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    context,
                    icon: Icons.phone_outlined,
                    title: 'Phone Number',
                    subtitle: '+1 (555) 123-4567',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    context,
                    icon: Icons.location_on_outlined,
                    title: 'Address',
                    subtitle: '123 Main St, City, State 12345',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Preferences Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Preferences',
                    style: AppTextStyles.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  _buildProfileOption(
                    context,
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    subtitle: 'Manage notification settings',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    context,
                    icon: Icons.language_outlined,
                    title: 'Language',
                    subtitle: 'English',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    context,
                    icon: Icons.dark_mode_outlined,
                    title: 'Theme',
                    subtitle: 'Dark Mode',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Support Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Support',
                    style: AppTextStyles.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  _buildProfileOption(
                    context,
                    icon: Icons.help_outline,
                    title: 'FAQ',
                    subtitle: 'Frequently asked questions',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    context,
                    icon: Icons.mail_outline,
                    title: 'Contact Us',
                    subtitle: 'support@qora.com',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    context,
                    icon: Icons.info_outline,
                    title: 'About',
                    subtitle: 'Version 1.0.0',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => context.go('/role-selection'),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.error),
                  ),
                  child: Text(
                    'Log Out',
                    style: AppTextStyles.buttonLarge.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return QoraCard(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.titleSmall),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTextStyles.captionSmall.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.Dark.textSecondary
                        : AppColors.Light.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.Dark.textSecondary
                : AppColors.Light.textSecondary,
          ),
        ],
      ),
    );
  }
}
