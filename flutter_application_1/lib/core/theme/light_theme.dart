import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

ThemeData buildLightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    
    // Primary Color
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.Light.background,
    
    // Color Scheme
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.accent,
      surface: AppColors.Light.surface,
      background: AppColors.Light.background,
      error: AppColors.error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onTertiary: Colors.white,
      onSurface: AppColors.Light.textPrimary,
      onBackground: AppColors.Light.textPrimary,
      onError: Colors.white,
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.Light.surface,
      foregroundColor: AppColors.Light.textPrimary,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: AppColors.Light.textPrimary),
      titleTextStyle: AppTextStyles.headingMedium.copyWith(
        color: AppColors.Light.textPrimary,
      ),
    ),

    // Card Theme
    cardTheme: CardTheme(
      color: AppColors.Light.card,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.zero,
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.Light.background,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.Light.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.Light.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
      hintStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.Light.textSecondary,
      ),
      labelStyle: AppTextStyles.labelLarge.copyWith(
        color: AppColors.Light.textPrimary,
      ),
      errorStyle: AppTextStyles.captionSmall.copyWith(
        color: AppColors.error,
      ),
    ),

    // Button Themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: AppTextStyles.buttonLarge,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: AppTextStyles.buttonLarge.copyWith(color: AppColors.primary),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textStyle: AppTextStyles.buttonMedium,
      ),
    ),

    // Dialog Theme
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.Light.surface,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titleTextStyle: AppTextStyles.headingMedium.copyWith(
        color: AppColors.Light.textPrimary,
      ),
      contentTextStyle: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.Light.textPrimary,
      ),
    ),

    // Bottom Sheet Theme
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.Light.surface,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),

    // FAB Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: AppColors.Light.divider,
      thickness: 1,
      space: 16,
    ),

    // Icon Theme
    iconTheme: IconThemeData(
      color: AppColors.Light.textPrimary,
      size: 24,
    ),

    // Progress Indicator Theme
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primary,
      linearTrackColor: AppColors.Light.border,
    ),

    // Switch Theme
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primary;
        }
        return AppColors.Light.textSecondary;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primary.withOpacity(0.5);
        }
        return AppColors.Light.border;
      }),
    ),

    // Checkbox Theme
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primary;
        }
        return Colors.transparent;
      }),
      side: BorderSide(color: AppColors.Light.border),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),

    // Radio Theme
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primary;
        }
        return AppColors.Light.textSecondary;
      }),
    ),

    // Text Theme
    textTheme: TextTheme(
      displayLarge: AppTextStyles.display.copyWith(color: AppColors.Light.textPrimary),
      displayMedium: AppTextStyles.headingLarge.copyWith(color: AppColors.Light.textPrimary),
      displaySmall: AppTextStyles.headingMedium.copyWith(color: AppColors.Light.textPrimary),
      headlineMedium: AppTextStyles.headingMedium.copyWith(color: AppColors.Light.textPrimary),
      headlineSmall: AppTextStyles.headingSmall.copyWith(color: AppColors.Light.textPrimary),
      titleLarge: AppTextStyles.title.copyWith(color: AppColors.Light.textPrimary),
      titleMedium: AppTextStyles.titleMedium.copyWith(color: AppColors.Light.textPrimary),
      titleSmall: AppTextStyles.titleSmall.copyWith(color: AppColors.Light.textPrimary),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.Light.textPrimary),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.Light.textPrimary),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.Light.textPrimary),
      labelLarge: AppTextStyles.labelLarge.copyWith(color: AppColors.Light.textPrimary),
      labelMedium: AppTextStyles.labelMedium.copyWith(color: AppColors.Light.textSecondary),
      labelSmall: AppTextStyles.labelSmall.copyWith(color: AppColors.Light.textSecondary),
    ),
  );
}
