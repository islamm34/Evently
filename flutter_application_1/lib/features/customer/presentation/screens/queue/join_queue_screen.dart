import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/qora_card.dart';

class JoinQueueScreen extends StatelessWidget {
  final String businessId;

  const JoinQueueScreen({
    Key? key,
    required this.businessId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Ticket', style: AppTextStyles.headingMedium),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Step Indicator
              Row(
                children: [
                  _buildStepCircle(1, true),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: AppColors.primary,
                    ),
                  ),
                  _buildStepCircle(2, true),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: AppColors.primary.withOpacity(0.2),
                    ),
                  ),
                  _buildStepCircle(3, false),
                ],
              ),
              const SizedBox(height: 24),

              // Business Info
              Text(
                'Business Details',
                style: AppTextStyles.titleMedium,
              ),
              const SizedBox(height: 12),
              QoraCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.business,
                        size: 48,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Central Clinic',
                      style: AppTextStyles.titleSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Healthcare • Open until 6:00 PM',
                      style: AppTextStyles.captionSmall.copyWith(
                        color: isDark
                            ? AppColors.Dark.textSecondary
                            : AppColors.Light.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current Queue',
                              style: AppTextStyles.captionSmall.copyWith(
                                color: isDark
                                    ? AppColors.Dark.textSecondary
                                    : AppColors.Light.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '5 people',
                              style: AppTextStyles.titleSmall,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Average Wait',
                              style: AppTextStyles.captionSmall.copyWith(
                                color: isDark
                                    ? AppColors.Dark.textSecondary
                                    : AppColors.Light.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '15 minutes',
                              style: AppTextStyles.titleSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Services Selection
              Text(
                'Select Services (Optional)',
                style: AppTextStyles.titleMedium,
              ),
              const SizedBox(height: 12),
              _buildServiceCheckbox(isDark, 'General Checkup', true),
              _buildServiceCheckbox(isDark, 'Blood Test', false),
              _buildServiceCheckbox(isDark, 'Vaccination', false),
              const SizedBox(height: 24),

              // Ticket Preview
              Text(
                'Your Ticket',
                style: AppTextStyles.titleMedium,
              ),
              const SizedBox(height: 12),
              QoraCard(
                child: Column(
                  children: [
                    Text(
                      'Ticket Number',
                      style: AppTextStyles.captionSmall.copyWith(
                        color: isDark
                            ? AppColors.Dark.textSecondary
                            : AppColors.Light.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '#1250',
                      style: AppTextStyles.headingLarge.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.queueWaiting.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Position: 5th in queue',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.queueWaiting,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'You will be notified when your turn is approaching',
                      style: AppTextStyles.captionSmall.copyWith(
                        color: isDark
                            ? AppColors.Dark.textSecondary
                            : AppColors.Light.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Confirm Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Confirm & Join Queue',
                    style: AppTextStyles.buttonLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepCircle(int step, bool isActive) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.primary : AppColors.primary.withOpacity(0.2),
      ),
      child: Center(
        child: Text(
          '$step',
          style: AppTextStyles.titleSmall.copyWith(
            color: isActive ? Colors.white : AppColors.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCheckbox(bool isDark, String title, bool checked) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Checkbox(
            value: checked,
            onChanged: (_) {},
          ),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
