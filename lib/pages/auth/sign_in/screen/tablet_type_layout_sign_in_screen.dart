import 'package:flutter/material.dart';

class TabletTypeLayoutSignInScreen extends StatelessWidget {
  const TabletTypeLayoutSignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tablet type layout on Sign In Screen'),
      ),
      body: const Center(
        child: Text(
          'Tablet type layout on Sign In Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
