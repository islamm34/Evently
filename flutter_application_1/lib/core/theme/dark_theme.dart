import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

ThemeData buildDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    
    // Primary Color
    primaryColor: AppColors.Dark.primary,
    scaffoldBackgroundColor: AppColors.Dark.background,
    
    // Color Scheme
    colorScheme: ColorScheme.dark(
      primary: AppColors.Dark.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.Dark.accent,
      surface: AppColors.Dark.surface,
      background: AppColors.Dark.background,
      error: AppColors.error,
      onPrimary: Colors.white,
      onSecondary: AppColors.Dark.background,
      onTertiary: AppColors.Dark.background,
      onSurface: AppColors.Dark.textPrimary,
      onBackground: AppColors.Dark.textPrimary,
      onError: Colors.white,
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.Dark.surface,
      foregroundColor: AppColors.Dark.textPrimary,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: AppColors.Dark.textPrimary),
      titleTextStyle: AppTextStyles.headingMedium.copyWith(
        color: AppColors.Dark.textPrimary,
      ),
    ),

    // Card Theme
    cardTheme: CardTheme(
      color: AppColors.Dark.card,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.zero,
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.Dark.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.Dark.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.Dark.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.Dark.primary, width: 2),
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
        color: AppColors.Dark.textSecondary,
      ),
      labelStyle: AppTextStyles.labelLarge.copyWith(
        color: AppColors.Dark.textPrimary,
      ),
      errorStyle: AppTextStyles.captionSmall.copyWith(
        color: AppColors.error,
      ),
    ),

    // Button Themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.Dark.primary,
        foregroundColor: AppColors.Dark.background,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: AppTextStyles.buttonLarge,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.Dark.primary,
        side: const BorderSide(color: AppColors.Dark.primary, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: AppTextStyles.buttonLarge.copyWith(color: AppColors.Dark.primary),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.Dark.primary,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textStyle: AppTextStyles.buttonMedium,
      ),
    ),

    // Dialog Theme
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.Dark.surface,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titleTextStyle: AppTextStyles.headingMedium.copyWith(
        color: AppColors.Dark.textPrimary,
      ),
      contentTextStyle: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.Dark.textPrimary,
      ),
    ),

    // Bottom Sheet Theme
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.Dark.surface,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),

    // FAB Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.Dark.primary,
      foregroundColor: AppColors.Dark.background,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: AppColors.Dark.divider,
      thickness: 1,
      space: 16,
    ),

    // Icon Theme
    iconTheme: IconThemeData(
      color: AppColors.Dark.textPrimary,
      size: 24,
    ),

    // Progress Indicator Theme
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.Dark.primary,
      linearTrackColor: AppColors.Dark.border,
    ),

    // Switch Theme
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.Dark.primary;
        }
        return AppColors.Dark.textSecondary;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.Dark.primary.withOpacity(0.5);
        }
        return AppColors.Dark.border;
      }),
    ),

    // Checkbox Theme
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.Dark.primary;
        }
        return Colors.transparent;
      }),
      side: const BorderSide(color: AppColors.Dark.border),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),

    // Radio Theme
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.Dark.primary;
        }
        return AppColors.Dark.textSecondary;
      }),
    ),

    // Text Theme
    textTheme: TextTheme(
      displayLarge: AppTextStyles.display.copyWith(color: AppColors.Dark.textPrimary),
      displayMedium: AppTextStyles.headingLarge.copyWith(color: AppColors.Dark.textPrimary),
      displaySmall: AppTextStyles.headingMedium.copyWith(color: AppColors.Dark.textPrimary),
      headlineMedium: AppTextStyles.headingMedium.copyWith(color: AppColors.Dark.textPrimary),
      headlineSmall: AppTextStyles.headingSmall.copyWith(color: AppColors.Dark.textPrimary),
      titleLarge: AppTextStyles.title.copyWith(color: AppColors.Dark.textPrimary),
      titleMedium: AppTextStyles.titleMedium.copyWith(color: AppColors.Dark.textPrimary),
      titleSmall: AppTextStyles.titleSmall.copyWith(color: AppColors.Dark.textPrimary),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.Dark.textPrimary),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.Dark.textPrimary),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.Dark.textPrimary),
      labelLarge: AppTextStyles.labelLarge.copyWith(color: AppColors.Dark.textPrimary),
      labelMedium: AppTextStyles.labelMedium.copyWith(color: AppColors.Dark.textSecondary),
      labelSmall: AppTextStyles.labelSmall.copyWith(color: AppColors.Dark.textSecondary),
    ),
  );
}
