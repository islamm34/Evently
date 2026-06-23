import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/qora_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications', style: AppTextStyles.headingMedium),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Mark all as read
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text('Mark all as read'),
            ),
          ),
          const SizedBox(height: 8),

          // Notifications
          _buildNotificationItem(
            context,
            isDark,
            title: 'Your turn is approaching',
            description: 'You\'re 3 positions away at Central Clinic',
            time: '5 mins ago',
            isRead: false,
            icon: Icons.notification_important,
            color: AppColors.primary,
          ),
          _buildNotificationItem(
            context,
            isDark,
            title: 'Ticket confirmed',
            description: 'Your ticket #1245 has been confirmed',
            time: '1 hour ago',
            isRead: true,
            icon: Icons.check_circle,
            color: AppColors.success,
          ),
          _buildNotificationItem(
            context,
            isDark,
            title: 'Service completed',
            description: 'Your service at ABC Bank has been completed',
            time: '2 hours ago',
            isRead: true,
            icon: Icons.done_all,
            color: AppColors.success,
          ),
          _buildNotificationItem(
            context,
            isDark,
            title: 'Queue opened',
            description: 'Central Hospital queue is now open',
            time: '3 hours ago',
            isRead: true,
            icon: Icons.info,
            color: AppColors.info,
          ),
          _buildNotificationItem(
            context,
            isDark,
            title: 'Reminder',
            description: 'Don\'t forget your appointment at 2:00 PM',
            time: 'Yesterday',
            isRead: true,
            icon: Icons.reminder,
            color: AppColors.warning,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(
    BuildContext context,
    bool isDark, {
    required String title,
    required String description,
    required String time,
    required bool isRead,
    required IconData icon,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: QoraCard(
        backgroundColor: isRead
            ? null
            : (isDark ? AppColors.Dark.surface : AppColors.Light.background),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.titleSmall.copyWith(
                      fontWeight: isRead ? FontWeight.w400 : FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: AppTextStyles.captionSmall.copyWith(
                      color: isDark
                          ? AppColors.Dark.textSecondary
                          : AppColors.Light.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: AppTextStyles.captionSmall.copyWith(
                      color: isDark
                          ? AppColors.Dark.textSecondary
                          : AppColors.Light.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (!isRead)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
