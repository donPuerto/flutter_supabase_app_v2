import 'package:flutter/material.dart';

class DesktopTypeLayoutSignInScreen extends StatelessWidget {
  const DesktopTypeLayoutSignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desktop type layout on Sign In Screen'),
      ),
      body: const Center(
        child: Text(
          'Desktop type layout on Sign In Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
