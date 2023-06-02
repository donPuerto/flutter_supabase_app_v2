import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'screen/desktop_type_layout_sign_in_screen.dart';
import 'screen/mobile_type_layout_sign_in_screen.dart';
import 'screen/tablet_type_layout_sign_in_screen.dart';

class SignInLayoutBuilder extends StatelessWidget {
  const SignInLayoutBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          // Render content for desktop
          return const DesktopTypeLayoutSignInScreen();
        } else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.tablet) {
          return const TabletTypeLayoutSignInScreen();
        } else {
          return const MobileTypeLayoutSignInScreen();
        }
      },
    );
  }
}
