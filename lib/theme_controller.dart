import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

final lightTheme = FlexThemeData.light(scheme: FlexScheme.brandBlue);
final darkTheme = FlexThemeData.dark(scheme: FlexScheme.brandBlue);

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(lightTheme);
  void switchTheme() => state = state == lightTheme ? darkTheme : lightTheme;
}
