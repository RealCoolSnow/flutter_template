import 'package:flutter/material.dart';
import 'app_color.dart';

@immutable
class AppTheme {
  static const bool isDark = false;
  static ThemeData main() {
    Color primary = AppColor.primary;
    Color secondary = AppColor.secondary;
    Color white = AppColor.white;
    TextTheme txtTheme =
        (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;
    ColorScheme colorScheme = ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        primaryContainer: primary,
        secondary: secondary,
        secondaryContainer: secondary,
        background: white,
        surface: white,
        onBackground: white,
        onSurface: white,
        onError: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.red.shade400);

    return ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme)
        .copyWith(
      textSelectionTheme: TextSelectionThemeData(cursorColor: primary),
      highlightColor: const Color(0xffe6e6e6),
    );
  }
}
