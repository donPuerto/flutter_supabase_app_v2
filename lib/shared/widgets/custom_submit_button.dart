// ignore_for_file: constant_identifier_names, prefer_final_fields

import 'package:flutter/material.dart';

enum ButtonType {
  TextButton,
  ElevatedButton,
  OutlinedButton,
}

class CustomSubmitButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final ButtonType buttonType;
  final bool isLoading;

  const CustomSubmitButton({
    Key? key,
    required this.buttonText,
    required this.buttonType,
    required this.isLoading,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomSubmitButton> createState() => _CustomSubmitButtonState();
}

class _CustomSubmitButtonState extends State<CustomSubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return SizedBox(
          width: double.infinity,
          child: _buildButton(context),
        );
      },
    );
  }

  Widget _buildButton(BuildContext context) {
    try {
      switch (widget.buttonType) {
        case ButtonType.TextButton:
          return TextButton(
            onPressed: widget.isLoading ? null : widget.onPressed,
            child: _buildButtonText(),
          );
        case ButtonType.ElevatedButton:
          return ElevatedButton(
            onPressed: widget.isLoading ? null : widget.onPressed,
            child: _buildButtonText(),
          );
        case ButtonType.OutlinedButton:
          return OutlinedButton(
            onPressed: widget.isLoading ? null : widget.onPressed,
            child: _buildButtonText(),
          );
        default:
          throw Exception('Invalid button type: ${widget.buttonType}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid button type encountered.'),
          duration: Duration(seconds: 2),
        ),
      );
      rethrow;
    }
  }

  Widget _buildButtonText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.buttonText,
      ),
    );
  }
}
