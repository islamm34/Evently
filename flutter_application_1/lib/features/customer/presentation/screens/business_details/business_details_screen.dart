import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/qora_button.dart';
import '../../../../../core/widgets/qora_card.dart';
import '../../mock_data.dart';

class BusinessDetailsScreen extends StatelessWidget {
  final String businessId;

  const BusinessDetailsScreen({
    Key? key,
    required this.businessId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final business = findMockBusiness(businessId);

    if (business == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Business Details')),
        body: const Center(child: Text('Business not found')),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: AppColors.primary.withOpacity(0.1),
                child: const Icon(
                  Icons.business,
                  size: 80,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
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
                              business.name,
                              style: AppTextStyles.headingMedium,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: AppColors.warning,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${business.rating} (${business.reviewCount} reviews)',
                                  style: AppTextStyles.bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: business.isOpen
                              ? AppColors.success.withOpacity(0.1)
                              : AppColors.error.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          business.isOpen ? 'Open' : 'Closed',
                          style: AppTextStyles.captionSmall.copyWith(
                            color: business.isOpen
                                ? AppColors.success
                                : AppColors.error,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  QoraCard(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Queue Status',
                              style: AppTextStyles.titleSmall,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    AppColors.queueWaiting.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Currently Busy',
                                style: AppTextStyles.captionSmall.copyWith(
                                  color: AppColors.queueWaiting,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildQueueStat(
                              'Current',
                              business.currentQueue.toString(),
                              Icons.people,
                            ),
                            _buildQueueStat(
                              'Avg Wait',
                              '${business.averageWaitTime} mins',
                              Icons.schedule,
                            ),
                            _buildQueueStat(
                              'Status',
                              business.isOpen ? 'Open' : 'Closed',
                              Icons.info,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('About', style: AppTextStyles.titleSmall),
                  const SizedBox(height: 8),
                  Text(
                    business.description,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isDark
                          ? AppColors.Dark.textSecondary
                          : AppColors.Light.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (business.services.isNotEmpty) ...[
                    Text('Services', style: AppTextStyles.titleSmall),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: business.services
                          .map(
                            (service) => Chip(
                              label: Text(service),
                              backgroundColor:
                                  AppColors.primary.withOpacity(0.1),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 16),
                  ],
                  QoraCard(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Address',
                                style: AppTextStyles.captionSmall.copyWith(
                                  color: isDark
                                      ? AppColors.Dark.textSecondary
                                      : AppColors.Light.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                business.address,
                                style: AppTextStyles.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  QoraCard(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hours',
                                style: AppTextStyles.captionSmall.copyWith(
                                  color: isDark
                                      ? AppColors.Dark.textSecondary
                                      : AppColors.Light.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${business.openingTime} - ${business.closingTime}',
                                style: AppTextStyles.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  QoraButton(
                    label: 'Join Queue Now',
                    onPressed: () =>
                        context.push('/join-queue/${business.id}'),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text('Add to Favorites'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQueueStat(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(height: 4),
        Text(value, style: AppTextStyles.titleSmall),
        const SizedBox(height: 2),
        Text(label, style: AppTextStyles.captionSmall),
      ],
    );
  }
}
