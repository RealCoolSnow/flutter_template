import 'package:flutter/material.dart';
import 'app_color.dart';

@immutable
class AppTheme {
  static const bool isDark = false;
  static ThemeData main() {
    Color primary = AppColor.primary;
    Color secondary = AppColor.secondary;
    TextTheme txtTheme =
        (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;
    ColorScheme colorScheme = ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        // primaryContainer: primary,
        secondary: secondary,
        // secondaryContainer: secondary,
        background: Colors.white,
        surface: Colors.white,
        onBackground: Colors.black,
        onSurface: Colors.black,
        onError: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        error: Colors.red.shade400);

    return ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme)
        .copyWith(
      textSelectionTheme: TextSelectionThemeData(cursorColor: primary),
      highlightColor: const Color(0xa0e6e6e6),
    );
  }
}
