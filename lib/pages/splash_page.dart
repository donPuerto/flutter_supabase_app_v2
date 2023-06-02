// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import '../shared/widgets/footer_widget.dart';
import '../shared/widgets/logo_widget.dart';
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
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: AnimatedSplashScreen(
                duration: 1500,
                splashIconSize: double.infinity,
                splash: Lottie.asset('assets/lottie/happy-face-loading.json'),
                nextScreen: const SignInLayoutBuilder(),
                splashTransition: SplashTransition.fadeTransition,
                pageTransitionType: PageTransitionType.fade,
              ),
            ),
            const SizedBox(height: 16.0),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
