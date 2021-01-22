import 'package:elinext_test_task/presentation/screen/country/tile/country_tile.dart';

abstract class CountryDescriptionMapper {
  Map<String, dynamic> toMap(CountryTile tile);

  CountryTile toCountryTile(List<Map<String, dynamic>> values);
}

class CountryDescriptionMapperImpl implements CountryDescriptionMapper {
  @override
  Map<String, dynamic> toMap(CountryTile tile) {
    final map = Map<String, dynamic>();
    map['source_id'] = tile.source.id;
    map['source_name'] = tile.source.name;
    map['author'] = tile.author;
    map['title'] = tile.title;
    map['description'] = tile.description;
    map['url'] = tile.url;
    map['urlToImage'] = tile.urlToImage;
    map['publishedAt'] = tile.publishedAt;
    map['content'] = tile.content;
    return map;
  }

  @override
  CountryTile toCountryTile(List<Map<String, dynamic>> values) {
    if (values.isEmpty) {
      return CountryTile();
    } else {
      return CountryTile(
          source: CountrySourceTile(
            id: values[0]['source_id'],
            name: values[0]['source_name'],
          ),
          author: values[0]['author'],
          title: values[0]['title'],
          description: values[0]['description'],
          url: values[0]['url'],
          urlToImage: values[0]['urlToImage'],
          publishedAt: values[0]['publishedAt'],
          content: values[0]['content']);
    }
  }
}
