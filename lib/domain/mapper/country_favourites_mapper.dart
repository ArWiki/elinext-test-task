import 'package:elinext_test_task/presentation/screen/country/tile/country_tile.dart';

abstract class CountryFavoritesMapper {
  List<CountryTile> toListCountryTile(List<Map<String, dynamic>> values);
}

class CountryFavoritesMapperImpl implements CountryFavoritesMapper {
  @override
  List<CountryTile> toListCountryTile(List<Map<String, dynamic>> values) {
    final list = List<CountryTile>();

    if (values.isEmpty) {
      return list;
    } else {
      values.forEach((element) {
        list.add(CountryTile(
            source: CountrySourceTile(
              id: element['source_id'],
              name: element['source_name'],
            ),
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            publishedAt: element['publishedAt'],
            content: element['content']));
      });
      return list;
    }
  }
}
