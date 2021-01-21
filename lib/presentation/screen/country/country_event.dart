import 'tile/country_tile.dart';

abstract class CountryEvent {}

class OpenCountryDescription extends CountryEvent {
  final CountryTile tile;

  OpenCountryDescription(this.tile);
}

class OpenCountryFavourite extends CountryEvent {}

class OnCountryRefresh extends CountryEvent {}