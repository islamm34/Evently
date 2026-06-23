import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class QoraCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double elevation;
  final BorderRadius? borderRadius;

  const QoraCard({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    this.backgroundColor,
    this.elevation = 2,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: elevation,
      color: backgroundColor ??
          (isDark ? AppColors.Dark.card : AppColors.Light.card),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

class QoraListTile extends StatelessWidget {
  final IconData? leadingIcon;
  final Widget? leading;
  final String title;
  final String? subtitle;
  final IconData? trailingIcon;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? backgroundColor;

  const QoraListTile({
    Key? key,
    this.leadingIcon,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailingIcon,
    this.onTap,
    this.trailing,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return QoraCard(
      backgroundColor: backgroundColor,
      onTap: onTap,
      child: Row(
        children: [
          if (leading != null)
            leading!
          else if (leadingIcon != null)
            Icon(
              leadingIcon,
              color: AppColors.primary,
              size: 24,
            ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.titleSmall.copyWith(
                    color: isDark
                        ? AppColors.Dark.textPrimary
                        : AppColors.Light.textPrimary,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: AppTextStyles.captionSmall.copyWith(
                      color: isDark
                          ? AppColors.Dark.textSecondary
                          : AppColors.Light.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null)
            trailing!
          else if (trailingIcon != null)
            Icon(
              trailingIcon,
              color: isDark
                  ? AppColors.Dark.textSecondary
                  : AppColors.Light.textSecondary,
            ),
        ],
      ),
    );
  }
}
