import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/qora_card.dart';

class DigitalTicketScreen extends StatelessWidget {
  const DigitalTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Ticket', style: AppTextStyles.headingMedium),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // QR Code Card
              QoraCard(
                child: Column(
                  children: [
                    Text(
                      'Scan at Counter',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: isDark
                            ? AppColors.Dark.textSecondary
                            : AppColors.Light.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: QrImage(
                        data: 'QORA-TICKET-1245-CENTRAL-CLINIC-2024-12-15',
                        version: QrVersions.auto,
                        size: 200,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'QORA-TICKET-1245',
                      style: AppTextStyles.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Ticket Details
              QoraCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ticket Details',
                      style: AppTextStyles.titleSmall,
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(
                      isDark,
                      'Ticket Number',
                      '#1245',
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      isDark,
                      'Business',
                      'Central Clinic',
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      isDark,
                      'Service',
                      'General Checkup',
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      isDark,
                      'Counter',
                      '#3',
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      isDark,
                      'Status',
                      'Currently Being Served',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Instructions
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.info.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.info,
                          color: AppColors.info,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Instructions',
                          style: AppTextStyles.titleSmall.copyWith(
                            color: AppColors.info,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '• Show this QR code at the counter when called\n• Keep your ticket number safe\n• Do not refresh this page\n• Your ticket is valid for this session only',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.info,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Download Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: const Text('Download Ticket'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(bool isDark, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: isDark
                ? AppColors.Dark.textSecondary
                : AppColors.Light.textSecondary,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
