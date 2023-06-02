import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year.toString();
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return Column(
      children: [
        Text(
          'Copyright © $currentYear, All Rights reserved.',
          style: TextStyle(
            fontSize: 10,
            color: colorScheme.primary,
          ),
        ),
        Text(
          "Develop by Don Puerto",
          style: TextStyle(
            fontSize: 8,
            color: colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
