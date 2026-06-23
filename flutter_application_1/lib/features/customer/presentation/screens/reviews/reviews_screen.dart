import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/qora_card.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews', style: AppTextStyles.headingMedium),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Rating Summary
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    '4.8',
                    style: AppTextStyles.headingLarge.copyWith(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        child: Icon(
                          Icons.star,
                          color: AppColors.warning,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Based on 512 reviews',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isDark
                          ? AppColors.Dark.textSecondary
                          : AppColors.Light.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // Rating Distribution
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: List.generate(
                  5,
                  (index) {
                    final rating = 5 - index;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          Text(
                            '$rating ★',
                            style: AppTextStyles.bodySmall,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: (6 - rating) / 5.0,
                                minHeight: 6,
                                backgroundColor:
                                    AppColors.primary.withOpacity(0.1),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.primary.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            '${(6 - rating) * 85}',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: isDark
                                  ? AppColors.Dark.textSecondary
                                  : AppColors.Light.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Reviews List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Customer Reviews',
                    style: AppTextStyles.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: QoraCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ahmed Hassan',
                                        style: AppTextStyles.titleSmall,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '2 days ago',
                                        style:
                                            AppTextStyles.captionSmall.copyWith(
                                          color: isDark
                                              ? AppColors.Dark.textSecondary
                                              : AppColors.Light.textSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: List.generate(
                                      5,
                                      (i) => Icon(
                                        Icons.star,
                                        color: i < (5 - index)
                                            ? AppColors.warning
                                            : AppColors.primary
                                                .withOpacity(0.2),
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Great service and professional staff. The queue moved smoothly and I was served quickly despite the crowd.',
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: isDark
                                      ? AppColors.Dark.textSecondary
                                      : AppColors.Light.textSecondary,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
