import 'package:flutter/material.dart';

import 'pages/profile/view_profile_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ViewProfilePage.routeName:
        return MaterialPageRoute(builder: (_) => const ViewProfilePage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
