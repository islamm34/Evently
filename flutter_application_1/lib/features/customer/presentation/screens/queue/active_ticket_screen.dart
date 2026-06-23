import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/qora_button.dart';
import '../../../../core/widgets/qora_card.dart';

class ActiveTicketScreen extends StatelessWidget {
  const ActiveTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Active Ticket', style: AppTextStyles.headingMedium),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Live Status Card
              QoraCard(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primary.withOpacity(0.1),
                            AppColors.secondary.withOpacity(0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Your Ticket Number',
                            style: AppTextStyles.captionSmall.copyWith(
                              color: isDark
                                  ? AppColors.Dark.textSecondary
                                  : AppColors.Light.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '#1245',
                            style: AppTextStyles.headingLarge.copyWith(
                              color: AppColors.primary,
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.queueWaiting.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Currently being served',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.queueWaiting,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildInfoBox(
                          label: 'Current',
                          value: '#1245',
                          isDark: isDark,
                        ),
                        _buildInfoBox(
                          label: 'Served',
                          value: '#1244',
                          isDark: isDark,
                        ),
                        _buildInfoBox(
                          label: 'Waiting',
                          value: '3',
                          isDark: isDark,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Business Info
              Text(
                'Service Details',
                style: AppTextStyles.titleMedium,
              ),
              const SizedBox(height: 12),
              QoraCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.business,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Central Clinic',
                                style: AppTextStyles.titleSmall,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'General Checkup',
                                style: AppTextStyles.captionSmall.copyWith(
                                  color: isDark
                                      ? AppColors.Dark.textSecondary
                                      : AppColors.Light.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.info.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.info,
                            size: 16,
                            color: AppColors.info,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Please go to counter #3 when your ticket is called',
                              style: AppTextStyles.captionSmall.copyWith(
                                color: AppColors.info,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Timeline
              Text(
                'Timeline',
                style: AppTextStyles.titleMedium,
              ),
              const SizedBox(height: 12),
              _buildTimelineItem(
                isDark,
                'Joined Queue',
                '2:15 PM',
                true,
              ),
              _buildTimelineItem(
                isDark,
                'Called to Counter',
                '2:25 PM',
                true,
              ),
              _buildTimelineItem(
                isDark,
                'Service Complete',
                'Waiting...',
                false,
              ),
              const SizedBox(height: 32),

              // Action Buttons
              QoraButton(
                label: 'View Digital Ticket',
                onPressed: () => context.push('/digital-ticket'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Leave Queue?'),
                      content: const Text(
                        'Are you sure you want to leave the queue? You won\'t be able to rejoin with the same ticket.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            context.pop();
                          },
                          child: const Text(
                            'Leave',
                            style: TextStyle(color: AppColors.error),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  side: const BorderSide(color: AppColors.error),
                ),
                child: Text(
                  'Leave Queue',
                  style: AppTextStyles.buttonLarge.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox({
    required String label,
    required String value,
    required bool isDark,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: AppTextStyles.captionSmall.copyWith(
            color: isDark
                ? AppColors.Dark.textSecondary
                : AppColors.Light.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.titleSmall,
        ),
      ],
    );
  }

  Widget _buildTimelineItem(
    bool isDark,
    String event,
    String time,
    bool isCompleted,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted ? AppColors.success : AppColors.primary.withOpacity(0.2),
                border: Border.all(
                  color: isCompleted ? AppColors.success : AppColors.primary,
                  width: 2,
                ),
              ),
              child: isCompleted
                  ? const Icon(
                      Icons.check,
                      size: 12,
                      color: Colors.white,
                    )
                  : null,
            ),
            if (event != 'Service Complete')
              Container(
                width: 2,
                height: 40,
                color: isCompleted
                    ? AppColors.success
                    : AppColors.primary.withOpacity(0.2),
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: isCompleted ? FontWeight.w500 : FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
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
        ),
      ],
    );
  }
}
