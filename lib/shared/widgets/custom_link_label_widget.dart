// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class CustomLinkLabelWidget extends StatelessWidget {
  final String text;
  final Widget page;

  const CustomLinkLabelWidget({
    Key? key,
    required this.text,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => page,
          ),
        );
      },
      child: Text(
        text,
        style: TextStyle(
          color: colorScheme.primary,
        ),
      ),
    );
  }
}
