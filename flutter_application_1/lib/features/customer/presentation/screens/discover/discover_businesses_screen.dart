import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/qora_card.dart';
import '../../mock_data.dart';

class DiscoverBusinessesScreen extends StatefulWidget {
  const DiscoverBusinessesScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverBusinessesScreen> createState() =>
      _DiscoverBusinessesScreenState();
}

class _DiscoverBusinessesScreenState extends State<DiscoverBusinessesScreen> {
  late final TextEditingController _searchController;
  String _searchQuery = '';
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final businesses = filterMockBusinesses(
      category: _selectedCategory,
      searchQuery: _searchQuery,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Discover Businesses', style: AppTextStyles.headingMedium),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => setState(() => _searchQuery = value),
                decoration: InputDecoration(
                  hintText: 'Search businesses...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _searchQuery = '');
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Categories', style: AppTextStyles.titleMedium),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: mockCategories.map((category) {
                        final isSelected = _selectedCategory == category;
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: FilterChip(
                            label: Text(category),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                _selectedCategory =
                                    selected ? category : null;
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _selectedCategory != null
                        ? '$_selectedCategory Businesses'
                        : 'All Businesses',
                    style: AppTextStyles.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  _buildBusinessesList(context, isDark, businesses),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBusinessesList(
    BuildContext context,
    bool isDark,
    List<MockBusiness> businesses,
  ) {
    if (businesses.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            'No businesses found',
            style: AppTextStyles.bodyMedium.copyWith(
              color: isDark
                  ? AppColors.Dark.textSecondary
                  : AppColors.Light.textSecondary,
            ),
          ),
        ),
      );
    }

    return Column(
      children: businesses.map((business) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GestureDetector(
            onTap: () => context.push('/business/${business.id}'),
            child: QoraCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.image_not_supported,
                      color: AppColors.primary,
                      size: 48,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              business.name,
                              style: AppTextStyles.titleSmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              business.category,
                              style: AppTextStyles.captionSmall.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 14,
                              color: AppColors.warning,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${business.rating}',
                              style: AppTextStyles.captionSmall.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 14,
                        color: isDark
                            ? AppColors.Dark.textSecondary
                            : AppColors.Light.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Wait: ${business.averageWaitTime} mins',
                        style: AppTextStyles.captionSmall.copyWith(
                          color: isDark
                              ? AppColors.Dark.textSecondary
                              : AppColors.Light.textSecondary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        Icons.people,
                        size: 14,
                        color: isDark
                            ? AppColors.Dark.textSecondary
                            : AppColors.Light.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${business.currentQueue} in queue',
                        style: AppTextStyles.captionSmall.copyWith(
                          color: isDark
                              ? AppColors.Dark.textSecondary
                              : AppColors.Light.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
