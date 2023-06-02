import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config/environment.dart';
import 'pages/auth/sign_in/sign_in_layout_builder.dart';
// import 'pages/theme_demo.dart';
//import 'pages/theme_demo.dart';
import 'pages/splash_page.dart';
import 'router.dart';
import 'shared/utils/constant.dart';
import 'themes/theme_controller.dart';

Future<void> main() async {
  // Bind Supabase
  WidgetsFlutterBinding.ensureInitialized();

  // Load enviroment
  await dotenv.load(fileName: ".env");

  // Initialized Supabase
  await Supabase.initialize(
    url: Environment.supabaseUrl,
    anonKey: Environment.supabaseAnonKey,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final theme = ref.watch(themeProvider);
        return ResponsiveApp(
          builder: (context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Supabase Appv2',
              theme: theme,
              navigatorKey: navigatorKey,
              initialRoute: SplashPage.routeName,
              onGenerateRoute: AppRouter.onGenerateRoute,
            );
          },
        );
      },
    );
  }
}
