abstract class CountryDescriptionEvent {}

class OpenCountryDescriptionNews extends CountryDescriptionEvent {
  final String url;

  OpenCountryDescriptionNews(this.url);
}