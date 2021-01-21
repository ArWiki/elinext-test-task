import 'package:elinext_test_task/domain/model/country/country.dart';
import 'tile/country_tile.dart';

abstract class CountryViewMapper {
  List<CountryTile> toItemList(Country country);
}

class CountryViewMapperImpl implements CountryViewMapper {
  @override
  List<CountryTile> toItemList(Country country) {
    final list = List<CountryTile>();

    country.articles.forEach(
      (element) {
        list.add(
          CountryTile(
            CountrySourceTile(
              element.source.id,
              element.source.name,
            ),
            element.author,
            element.title,
            element.description,
            element.url,
            element.urlToImage,
            element.publishedAt,
            element.content,
          ),
        );
      },
    );

    return list;
  }
}
