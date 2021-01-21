import 'package:elinext_test_task/presentation/screen/country/country_screen.dart';
import 'package:elinext_test_task/presentation/screen/country_details/country_details_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => CountryScreen(
            title: "Main",
          ),
        );
      case '/CountryDetails':
        return MaterialPageRoute(
          builder: (_) => CountryDetailsScreen(
            tile: settings.arguments,
            title: "Details",
          ),
        );
      // case '/third':
      //   return MaterialPageRoute(
      //     builder: (_) => ThirdScreen(
      //       title: "Thirst Screen",
      //       color: Colors.greenAccent,
      //     ),
      //   );
      // case '/settings':
      //   return MaterialPageRoute(
      //     builder: (_) => SettingsScreen(),
      //   );
      default:
        return MaterialPageRoute(
          builder: (_) => CountryScreen(
            title: "Main",
          ),
        );
    }
  }
}