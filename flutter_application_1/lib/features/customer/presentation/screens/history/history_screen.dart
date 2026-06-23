import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/qora_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('History', style: AppTextStyles.headingMedium),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHistoryCard(
            context,
            isDark,
            businessName: 'Central Clinic',
            ticketNumber: '#1245',
            date: 'Dec 15, 2024',
            time: '2:30 PM - 2:45 PM',
            duration: '15 mins',
            status: 'completed',
          ),
          _buildHistoryCard(
            context,
            isDark,
            businessName: 'ABC Bank',
            ticketNumber: '#1089',
            date: 'Dec 14, 2024',
            time: '10:15 AM - 10:45 AM',
            duration: '30 mins',
            status: 'completed',
          ),
          _buildHistoryCard(
            context,
            isDark,
            businessName: 'City Hospital',
            ticketNumber: '#0956',
            date: 'Dec 13, 2024',
            time: '3:00 PM',
            duration: '45 mins',
            status: 'cancelled',
          ),
          _buildHistoryCard(
            context,
            isDark,
            businessName: 'Government Services',
            ticketNumber: '#0812',
            date: 'Dec 12, 2024',
            time: '9:30 AM - 10:15 AM',
            duration: '45 mins',
            status: 'completed',
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(
    BuildContext context,
    bool isDark, {
    required String businessName,
    required String ticketNumber,
    required String date,
    required String time,
    required String duration,
    required String status,
  }) {
    final isCompleted = status == 'completed';
    final statusColor =
        isCompleted ? AppColors.success : AppColors.error;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: QoraCard(
        onTap: () => context.push('/history-details/$ticketNumber'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        businessName,
                        style: AppTextStyles.titleSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Ticket $ticketNumber',
                        style: AppTextStyles.captionSmall.copyWith(
                          color: isDark
                              ? AppColors.Dark.textSecondary
                              : AppColors.Light.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    status.toUpperCase(),
                    style: AppTextStyles.captionSmall.copyWith(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 14,
                  color: isDark
                      ? AppColors.Dark.textSecondary
                      : AppColors.Light.textSecondary,
                ),
                const SizedBox(width: 6),
                Text(
                  date,
                  style: AppTextStyles.captionSmall.copyWith(
                    color: isDark
                        ? AppColors.Dark.textSecondary
                        : AppColors.Light.textSecondary,
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.schedule,
                  size: 14,
                  color: isDark
                      ? AppColors.Dark.textSecondary
                      : AppColors.Light.textSecondary,
                ),
                const SizedBox(width: 6),
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
            if (isCompleted) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.timer,
                    size: 14,
                    color: isDark
                        ? AppColors.Dark.textSecondary
                        : AppColors.Light.textSecondary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Duration: $duration',
                    style: AppTextStyles.captionSmall.copyWith(
                      color: isDark
                          ? AppColors.Dark.textSecondary
                          : AppColors.Light.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
