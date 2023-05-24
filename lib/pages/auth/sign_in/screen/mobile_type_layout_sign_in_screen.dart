import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MobileTypeLayoutSignInScreen extends StatelessWidget {
  const MobileTypeLayoutSignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile type layout on Sign In Screen'),
      ),
      body: OrientationLayoutBuilder(
        portrait: (BuildContext context) => _buildPortraitLayout(),
        landscape: (BuildContext context) => _buildLandscapeLayout(),
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return const Center(
      child: Text(
        'Portrait Mode',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return const Center(
      child: Text(
        'Landscape Mode',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
