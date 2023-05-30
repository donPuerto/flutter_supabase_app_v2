import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'auth/sign_in/sign_in_layout_builder.dart';

// import 'main_page.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 1500,
        splashIconSize: double.infinity,
        splash: ListView(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          children: [
            Column(
              children: [
                const Logo(),
                SizedBox(height: 23.h),
                const Footer(),
              ],
            ),
          ],
        ),
        nextScreen: const SignInLayoutBuilder(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
      ),
    );
  }
}
