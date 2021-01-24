import 'package:elinext_test_task/presentation/screen/country/tile/country_tile.dart';

abstract class CountryDetailsMapper {
  Map<String, dynamic> toMap(CountryTile tile);

  CountryTile toCountryTile(List<Map<String, dynamic>> values);
}

class CountryDetailsMapperImpl implements CountryDetailsMapper {
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
            id: values.first['source_id'],
            name: values.first['source_name'],
          ),
          author: values.first['author'],
          title: values.first['title'],
          description: values.first['description'],
          url: values.first['url'],
          urlToImage: values.first['urlToImage'],
          publishedAt: values.first['publishedAt'],
          content: values.first['content']);
    }
  }
}
