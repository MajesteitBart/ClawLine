import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData build() {
    const seedColor = Color(0xFF0E7C86);
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.light,
        ).copyWith(
          primary: const Color(0xFF0B5D66),
          onPrimary: Colors.white,
          secondary: const Color(0xFF7D5A27),
          tertiary: const Color(0xFFB44F35),
          surface: const Color(0xFFFFFBF5),
          surfaceContainerHighest: const Color(0xFFE4E8E8),
          outlineVariant: const Color(0xFFD0D8D7),
          shadow: const Color(0x1F0F1720),
        );

    final textTheme = Typography.material2021(platform: TargetPlatform.android)
        .black
        .copyWith(
          headlineLarge: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            height: 1.05,
            letterSpacing: -0.8,
          ),
          headlineMedium: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            height: 1.1,
          ),
          titleLarge: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 1.1,
          ),
          bodyLarge: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.35,
          ),
          bodyMedium: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.35,
          ),
          labelLarge: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.1,
          ),
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xFFF4F1EA),
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surface,
        selectedColor: colorScheme.primaryContainer,
        secondarySelectedColor: colorScheme.secondaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        side: BorderSide(color: colorScheme.outlineVariant),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface.withAlpha(242),
        labelTextStyle: WidgetStateProperty.all(
          textTheme.labelLarge?.copyWith(color: colorScheme.onSurface),
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            color: states.contains(WidgetState.selected)
                ? colorScheme.primary
                : colorScheme.onSurfaceVariant,
          ),
        ),
        indicatorColor: colorScheme.primaryContainer,
      ),
    );
  }
}
