import 'package:elinext_test_task/presentation/screen/country/country_screen.dart';
import 'package:elinext_test_task/presentation/screen/country_details/country_details_screen.dart';
import 'package:elinext_test_task/presentation/screen/country_favourites/country_favourites_screen.dart';
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
      case '/CountryFavourites':
        return MaterialPageRoute(
          builder: (_) => CountryFavouritesScreen(
            title: "Favourites",
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => CountryScreen(
            title: "Main",
          ),
        );
    }
  }
}