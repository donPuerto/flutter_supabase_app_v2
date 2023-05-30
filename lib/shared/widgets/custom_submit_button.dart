// ignore_for_file: constant_identifier_names, prefer_final_fields

import 'package:flutter/material.dart';

import 'custom_snackbar_widget.dart';

enum ButtonType {
  TextButton,
  ElevatedButton,
  OutlinedButton,
}

class CustomSubmitButton extends StatefulWidget {
  final Function submitFunction;
  final String buttonText;
  final ButtonType buttonType;
  final bool isLoading;

  const CustomSubmitButton({
    Key? key,
    required this.submitFunction,
    required this.buttonText,
    required this.buttonType,
    required this.isLoading,
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
    switch (widget.buttonType) {
      case ButtonType.TextButton:
        return TextButton(
          onPressed: widget.isLoading ? null : _handleButtonPress,
          child: _buildButtonText(),
        );
      case ButtonType.ElevatedButton:
        return ElevatedButton(
          onPressed: widget.isLoading ? null : _handleButtonPress,
          child: _buildButtonText(),
        );
      case ButtonType.OutlinedButton:
        return OutlinedButton(
          onPressed: widget.isLoading ? null : _handleButtonPress,
          child: _buildButtonText(),
        );
      default:
        throw Exception('Invalid button type: ${widget.buttonType}');
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

  Future<void> _handleButtonPress() async {
    if (widget.isLoading) {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackbarWidget(
          message: 'Unexpected error occurred',
          type: SnackBarType.Error,
        ),
      ); // Don't process button press if loading
    }

    try {
      await widget.submitFunction(context);
    } catch (error) {
      // Handle error
    }

    if (widget.isLoading) {
      return; // Don't process button press if loading
    }
  }
}
