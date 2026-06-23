import 'package:flutter/material.dart';

/// Qora Color System - Professional SaaS Design
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  /// ==================== PRIMARY COLORS ====================
  static const Color primary = Color(0xFF3B82F6); // Primary Blue
  static const Color primaryLight = Color(0xFF60A5FA); // Secondary Blue
  static const Color primaryDark = Color(0xFF1E40AF); // Dark Blue

  /// ==================== SECONDARY COLORS ====================
  static const Color secondary = Color(0xFF60A5FA); // Light Blue
  static const Color secondaryLight = Color(0xFFDEF7FA); // Very Light Blue
  static const Color secondaryDark = Color(0xFF0369A1); // Darker Blue

  /// ==================== ACCENT COLORS ====================
  static const Color accent = Color(0xFF22D3EE); // Cyan
  static const Color accentLight = Color(0xFFA5F3FC); // Light Cyan
  static const Color accentDark = Color(0xFF0891B2); // Dark Cyan

  /// ==================== STATUS COLORS ====================
  static const Color success = Color(0xFF22C55E); // Green
  static const Color warning = Color(0xFFF59E0B); // Amber
  static const Color error = Color(0xFFEF4444); // Red
  static const Color info = Color(0xFF3B82F6); // Blue

  /// ==================== QUEUE STATUS COLORS ====================
  static const Color queueWaiting = Color(0xFFF59E0B); // Amber
  static const Color queueServing = Color(0xFF3B82F6); // Blue
  static const Color queueCompleted = Color(0xFF22C55E); // Green
  static const Color queueMissed = Color(0xFFEF4444); // Red

  /// ==================== LIGHT THEME COLORS ====================
  static class Light {
    static const Color background = Color(0xFFF8FAFC); // Slate 50
    static const Color surface = Color(0xFFFFFFFF); // White
    static const Color card = Color(0xFFFFFFFF); // White
    static const Color textPrimary = Color(0xFF0F172A); // Slate 900
    static const Color textSecondary = Color(0xFF64748B); // Slate 500
    static const Color border = Color(0xFFE2E8F0); // Slate 200
    static const Color divider = Color(0xFFE2E8F0); // Slate 200
    static const Color disabled = Color(0xFFCBD5E1); // Slate 300
    static const Color shadow = Color(0x1F000000); // 12% Black
  }

  /// ==================== DARK THEME COLORS ====================
  static class Dark {
    static const Color background = Color(0xFF0F172A); // Slate 900
    static const Color surface = Color(0xFF1E293B); // Slate 800
    static const Color card = Color(0xFF1E293B); // Slate 800
    static const Color textPrimary = Color(0xFFF8FAFC); // Slate 50
    static const Color textSecondary = Color(0xFFCBD5E1); // Slate 300
    static const Color border = Color(0xFF334155); // Slate 700
    static const Color divider = Color(0xFF334155); // Slate 700
    static const Color disabled = Color(0xFF475569); // Slate 600
    static const Color shadow = Color(0x3F000000); // 25% Black
    static const Color primary = Color(0xFF60A5FA); // Light Blue for dark mode
    static const Color accent = Color(0xFF22D3EE); // Cyan
  }

  /// ==================== NEUTRAL COLORS ====================
  static class Neutral {
    static const Color white = Color(0xFFFFFFFF);
    static const Color black = Color(0xFF000000);
    static const Color transparent = Color(0x00000000);
  }

  /// ==================== GRADIENT COLORS ====================
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF22D3EE), Color(0xFF06B6D4)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient successGradient = LinearGradient(
    colors: [Color(0xFF22C55E), Color(0xFF16A34A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient errorGradient = LinearGradient(
    colors: [Color(0xFFEF4444), Color(0xFFDC2626)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// ==================== SEMANTIC COLORS ====================
  static const Color success2 = Color(0xFF10B981); // Emerald
  static const Color warning2 = Color(0xFFF97316); // Orange
  static const Color error2 = Color(0xFFF43F5E); // Rose
}
