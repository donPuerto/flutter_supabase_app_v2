import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'dark_theme_scheme.dart';
import 'light_theme_scheme.dart';
import 'true_dark_theme.dart';

enum ThemeOption {
  light,
  dark,
  trueBlack,
}

final lightTheme = lightThemeScheme;
final darkTheme = darkThemeScheme;
final trueBlackTheme = trueBlackThemeScheme;

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(lightTheme);

  ThemeOption setTheme(ThemeOption themeOption) {
    switch (themeOption) {
      case ThemeOption.light:
        state = lightTheme;
        break;
      case ThemeOption.dark:
        state = darkTheme;
        break;
      case ThemeOption.trueBlack:
        state = trueBlackTheme;
        break;
    }
    return themeOption; // Return the selected theme option
  }
}
