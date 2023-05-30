// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;

  const CustomTextFieldWidget({
    required Key key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.validator,
    required this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _borderRadius = BorderRadius.circular(4.0);
    final _enabledBorderSide = Theme.of(context).colorScheme.primary;
    final _focusedBorderSide = Theme.of(context).colorScheme.primary;
    final _errorBorderSide = Theme.of(context).colorScheme.error;

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceVariant,
        labelText: labelText,
        labelStyle: GoogleFonts.notoSans(
          color: Theme.of(context).inputDecorationTheme.labelStyle?.color,
          fontWeight:
              Theme.of(context).inputDecorationTheme.labelStyle?.fontWeight,
          fontSize: Theme.of(context).inputDecorationTheme.labelStyle?.fontSize,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0, color: _enabledBorderSide),
          borderRadius: _borderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: _focusedBorderSide),
          borderRadius: _borderRadius,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: _errorBorderSide),
          borderRadius: _borderRadius,
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: _errorBorderSide),
            borderRadius: _borderRadius),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).inputDecorationTheme.hintStyle?.color,
          fontWeight:
              Theme.of(context).inputDecorationTheme.hintStyle?.fontWeight,
          fontSize: Theme.of(context).inputDecorationTheme.hintStyle?.fontSize,
        ),
      ),
      validator: validator,
      autovalidateMode: autovalidateMode,
    );
  }
}
