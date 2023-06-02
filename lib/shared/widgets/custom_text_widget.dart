// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print, unused_element

import 'package:flutter/material.dart';

enum TextSize {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextSize? textSize;

  const CustomTextWidget({
    Key? key,
    required this.text,
    this.textSize = TextSize.labelMedium,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle? textStyle = _getTextStyle(theme);
    const double defaultFontSize = 14.0;
    return Text(
      text,
      style:
          textStyle?.copyWith(fontSize: textStyle.fontSize ?? defaultFontSize),
    );
  }

  TextStyle? _getTextStyle(ThemeData theme) {
    switch (textSize) {
      case TextSize.displayLarge:
        return theme.textTheme.displayLarge;
      case TextSize.displayMedium:
        return theme.textTheme.displayMedium;
      case TextSize.displaySmall:
        return theme.textTheme.displaySmall;
      case TextSize.headlineLarge:
        return theme.textTheme.headlineLarge;
      case TextSize.headlineMedium:
        return theme.textTheme.headlineMedium;
      case TextSize.headlineSmall:
        return theme.textTheme.headlineSmall;
      case TextSize.titleLarge:
        return theme.textTheme.titleLarge;
      case TextSize.titleMedium:
        return theme.textTheme.titleMedium;
      case TextSize.titleSmall:
        return theme.textTheme.titleSmall;
      case TextSize.bodyLarge:
        return theme.textTheme.bodyLarge;
      case TextSize.bodyMedium:
        return theme.textTheme.bodyMedium;
      case TextSize.bodySmall:
        return theme.textTheme.bodySmall;
      case TextSize.labelLarge:
        return theme.textTheme.labelLarge;
      case TextSize.labelMedium:
        return theme.textTheme.labelMedium;
      case TextSize.labelSmall:
        return theme.textTheme.labelSmall;
      default:
        return null;
    }
  }
}
