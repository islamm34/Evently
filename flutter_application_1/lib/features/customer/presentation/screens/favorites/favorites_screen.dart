import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/qora_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final favorites = [
      {
        'name': 'Central Clinic',
        'category': 'Healthcare',
        'rating': 4.8,
        'reviews': 245,
        'queue': 3,
        'wait': 15,
      },
      {
        'name': 'ABC Bank',
        'category': 'Financial',
        'rating': 4.5,
        'reviews': 128,
        'queue': 5,
        'wait': 25,
      },
      {
        'name': 'City Hospital',
        'category': 'Healthcare',
        'rating': 4.9,
        'reviews': 512,
        'queue': 8,
        'wait': 40,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites', style: AppTextStyles.headingMedium),
        elevation: 0,
      ),
      body: favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 64,
                    color: isDark
                        ? AppColors.Dark.textSecondary
                        : AppColors.Light.textSecondary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No favorites yet',
                    style: AppTextStyles.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add your favorite businesses to quick access them',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isDark
                          ? AppColors.Dark.textSecondary
                          : AppColors.Light.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: List.generate(
                favorites.length,
                (index) {
                  final fav = favorites[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: QoraCard(
                      onTap: () =>
                          context.push('/business/${fav['name']}'),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
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
                                  fav['name'] as String,
                                  style: AppTextStyles.titleSmall,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 14,
                                      color: AppColors.warning,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${fav['rating']} (${fav['reviews']})',
                                      style: AppTextStyles.captionSmall,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${fav['queue']} in queue • ${fav['wait']} mins wait',
                                  style: AppTextStyles.captionSmall.copyWith(
                                    color: isDark
                                        ? AppColors.Dark.textSecondary
                                        : AppColors.Light.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.favorite,
                              color: AppColors.error,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
