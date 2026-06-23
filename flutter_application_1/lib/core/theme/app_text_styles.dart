import 'package:flutter/material.dart';

/// Qora Typography System - Professional SaaS Design
class AppTextStyles {
  // Private constructor to prevent instantiation
  AppTextStyles._();

  /// Font: Inter or SF Pro Display
  static const String _fontFamily = 'Inter';

  /// ==================== HEADING STYLES ====================

  /// Heading Large - 32px, Bold, used for main titles
  static const TextStyle headingLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    height: 1.2,
    letterSpacing: -0.5,
  );

  /// Heading Medium - 24px, Bold, used for section titles
  static const TextStyle headingMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    height: 1.3,
    letterSpacing: -0.3,
  );

  /// Heading Small - 20px, Semi Bold, used for subsection titles
  static const TextStyle headingSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    height: 1.4,
    letterSpacing: -0.2,
  );

  /// ==================== TITLE STYLES ====================

  /// Title - 20px, Semi Bold
  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    height: 1.4,
    letterSpacing: 0,
  );

  /// Title Medium - 18px, Semi Bold
  static const TextStyle titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    height: 1.4,
    letterSpacing: 0,
  );

  /// Title Small - 16px, Semi Bold
  static const TextStyle titleSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    height: 1.5,
    letterSpacing: 0,
  );

  /// ==================== BODY STYLES ====================

  /// Body Large - 16px, Regular, main content
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    height: 1.5,
    letterSpacing: 0.5,
  );

  /// Body Medium - 14px, Regular
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    height: 1.5,
    letterSpacing: 0.25,
  );

  /// Body Small - 13px, Regular
  static const TextStyle bodySmall = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    height: 1.5,
    letterSpacing: 0.25,
  );

  /// ==================== CAPTION STYLES ====================

  /// Caption - 13px, Regular, small text
  static const TextStyle caption = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    height: 1.4,
    letterSpacing: 0,
  );

  /// Caption Small - 12px, Regular
  static const TextStyle captionSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    height: 1.4,
    letterSpacing: 0,
  );

  /// ==================== BUTTON STYLES ====================

  /// Button Large - 16px, Semi Bold
  static const TextStyle buttonLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    height: 1.5,
    letterSpacing: 0.5,
  );

  /// Button Medium - 14px, Semi Bold
  static const TextStyle buttonMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    height: 1.5,
    letterSpacing: 0.25,
  );

  /// Button Small - 12px, Semi Bold
  static const TextStyle buttonSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    height: 1.5,
    letterSpacing: 0,
  );

  /// ==================== LABEL STYLES ====================

  /// Label Large - 14px, Medium
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
    height: 1.5,
    letterSpacing: 0.1,
  );

  /// Label Medium - 12px, Medium
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
    height: 1.5,
    letterSpacing: 0.5,
  );

  /// Label Small - 11px, Medium
  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
    height: 1.5,
    letterSpacing: 0.5,
  );

  /// ==================== SPECIAL STYLES ====================

  /// Display - 48px, Bold, for hero sections
  static const TextStyle display = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    height: 1.2,
    letterSpacing: -1,
  );

  /// Overline - 11px, Semi Bold, uppercase
  static const TextStyle overline = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    height: 1.6,
    letterSpacing: 1.5,
  );

  /// Input Text - 16px, Regular
  static const TextStyle inputText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    height: 1.5,
    letterSpacing: 0.5,
  );
}
