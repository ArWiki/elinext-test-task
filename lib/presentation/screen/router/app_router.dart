import 'package:elinext_test_task/presentation/screen/country/country_screen.dart';
import 'package:elinext_test_task/presentation/screen/country_details/country_details_screen.dart';
import 'package:elinext_test_task/presentation/screen/country_favorites/country_favorites_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => CountryScreen(
            title: 'Main',
          ),
        );
      case '/CountryDetails':
        return MaterialPageRoute(
          builder: (_) => CountryDetailsScreen(
            tile: settings.arguments,
            title: 'Details',
          ),
        );
      case '/CountryFavorites':
        return MaterialPageRoute(
          builder: (_) => CountryFavoritesScreen(
            title: 'Favorites',
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => CountryScreen(
            title: 'Main',
          ),
        );
    }
  }
}