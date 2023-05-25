import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase_app_v2/theme_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MobileTypeLayoutSignInScreen extends StatelessWidget {
  const MobileTypeLayoutSignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Mobile type layout on Sign In Screen'),
          ),
          body: OrientationLayoutBuilder(
            portrait: (BuildContext context) => _buildPortraitLayout(),
            landscape: (BuildContext context) => _buildLandscapeLayout(),
          ),
          floatingActionButton: ThemeSwitcher(
            clipper: const ThemeSwitcherCircleClipper(),
            // clipper: const ThemeSwitcherBoxClipper(),
            builder: (context) {
              return FloatingActionButton(
                child: const Icon(Icons.lightbulb),
                onPressed: () {
                  ThemeSwitcher.of(context).changeTheme(
                    theme: ThemeModelInheritedNotifier.of(context)
                                .theme
                                .brightness ==
                            Brightness.light
                        ? darkTheme
                        : lightTheme,
                  );
                },
              );
            },
          )),
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
