// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter/material.dart';

class CustomCheckboxWidget extends StatelessWidget {
  final bool value;
  final Function(bool?)? onChanged;
  const CustomCheckboxWidget({Key? key, required this.value, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return InkWell(
      onTap: () => onChanged?.call(!value),
      child: Icon(
        value ? Icons.check_box : Icons.check_box_outline_blank,
        size: 24.0,
        color: value ? colorScheme.primary : colorScheme.onBackground,
      ),
    );
  }
}
