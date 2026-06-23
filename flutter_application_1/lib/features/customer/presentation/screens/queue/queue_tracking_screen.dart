import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/qora_card.dart';

class QueueTrackingScreen extends StatelessWidget {
  const QueueTrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Queue Tracking', style: AppTextStyles.headingMedium),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Queue Status Overview
              QoraCard(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Central Clinic',
                          style: AppTextStyles.titleSmall,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.queueWaiting.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Live',
                            style: AppTextStyles.captionSmall.copyWith(
                              color: AppColors.queueWaiting,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatBox(
                          isDark,
                          'Now Serving',
                          '#1245',
                          AppColors.success,
                        ),
                        _buildStatBox(
                          isDark,
                          'Total in Queue',
                          '8',
                          AppColors.primary,
                        ),
                        _buildStatBox(
                          isDark,
                          'Your Position',
                          '3',
                          AppColors.warning,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Progress Visualization
              Text(
                'Queue Progress',
                style: AppTextStyles.titleMedium,
              ),
              const SizedBox(height: 16),
              _buildQueueVisualization(isDark),
              const SizedBox(height: 32),

              // Estimated Wait Time
              QoraCard(
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.schedule,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Estimated Wait Time',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: isDark
                                  ? AppColors.Dark.textSecondary
                                  : AppColors.Light.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '8 minutes',
                            style: AppTextStyles.headingSmall,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Based on current queue pace',
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
              ),
              const SizedBox(height: 24),

              // Counter Status
              Text(
                'Counter Status',
                style: AppTextStyles.titleMedium,
              ),
              const SizedBox(height: 12),
              _buildCounterStatus(isDark, 'Counter #1', '#1243', 'Serving', true),
              _buildCounterStatus(isDark, 'Counter #2', '#1244', 'Serving', true),
              _buildCounterStatus(isDark, 'Counter #3', '#1245', 'Your Turn', false),
              _buildCounterStatus(isDark, 'Counter #4', '-', 'On Break', false),
              const SizedBox(height: 24),

              // Timeline
              Text(
                'Your Timeline',
                style: AppTextStyles.titleMedium,
              ),
              const SizedBox(height: 12),
              _buildTimelineItem(
                isDark,
                '2:15 PM',
                'Joined Queue',
                'Position: 5',
                true,
              ),
              _buildTimelineItem(
                isDark,
                '2:18 PM',
                'Moved to Position 4',
                '#1241 served',
                true,
              ),
              _buildTimelineItem(
                isDark,
                '2:22 PM',
                'Moved to Position 3',
                '#1242 served',
                true,
              ),
              _buildTimelineItem(
                isDark,
                '2:26 PM',
                'Approaching Your Turn',
                'Get ready!',
                false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatBox(
    bool isDark,
    String label,
    String value,
    Color color,
  ) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.1),
          ),
          child: Center(
            child: Icon(
              Icons.check_circle,
              color: color,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: AppTextStyles.titleSmall.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.captionSmall.copyWith(
            color: isDark
                ? AppColors.Dark.textSecondary
                : AppColors.Light.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildQueueVisualization(bool isDark) {
    return Column(
      children: [
        // Visual representation
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark
                ? AppColors.Dark.background
                : AppColors.Light.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.primary.withOpacity(0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Queue Order:',
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildQueueBadge('#1243', AppColors.success, 'Served'),
                  _buildQueueBadge('#1244', AppColors.success, 'Served'),
                  _buildQueueBadge('#1245', AppColors.primary, 'Your Turn'),
                  _buildQueueBadge('#1246', AppColors.queueWaiting, 'Waiting'),
                  _buildQueueBadge('#1247', AppColors.queueWaiting, 'Waiting'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQueueBadge(String number, Color color, String label) {
    return Chip(
      label: Text(number),
      backgroundColor: color.withOpacity(0.1),
      labelStyle: AppTextStyles.bodySmall.copyWith(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildCounterStatus(
    bool isDark,
    String counterName,
    String currentTicket,
    String status,
    bool isActive,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: QoraCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  counterName,
                  style: AppTextStyles.titleSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  'Serving: $currentTicket',
                  style: AppTextStyles.captionSmall.copyWith(
                    color: isDark
                        ? AppColors.Dark.textSecondary
                        : AppColors.Light.textSecondary,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.success.withOpacity(0.1)
                    : AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                status,
                style: AppTextStyles.captionSmall.copyWith(
                  color: isActive ? AppColors.success : AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem(
    bool isDark,
    String time,
    String event,
    String detail,
    bool isCompleted,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted
                      ? AppColors.success
                      : AppColors.primary.withOpacity(0.2),
                  border: Border.all(
                    color:
                        isCompleted ? AppColors.success : AppColors.primary,
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
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  detail,
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
        ],
      ),
    );
  }
}
