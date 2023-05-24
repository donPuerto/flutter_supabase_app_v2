import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'pages/auth/sign_in/sign_in_layout_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (context) {
        return const MaterialApp(
          title: 'Flutter Supabase Appv2',
          home: SignInLayoutBuilder(),
        );
      },
    );
  }
}
