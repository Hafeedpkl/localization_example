import 'package:flutter/material.dart';
import 'package:localization_example/pages/bottom_navigation.dart';
import 'package:localization_example/router/route_constants.dart';

import '../pages/calender_screen.dart';
import '../pages/home_page.dart';
import '../pages/story_page.dart';
import '../pages/settings_page.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case bottomNavRoute:
        return MaterialPageRoute(
          builder: (_) => BottomNavScreen(),
        );
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => const ArticlePage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      default:
        return MaterialPageRoute(builder: (_) => const StoryPage());
    }
  }
}
