import 'package:elinext_test_task/presentation/screen/country/tile/country_tile.dart';
import 'tile/country_details_tile.dart';

abstract class CountryDetailsViewMapper {
  CountryDetailsTile toCountryDetailsTile(CountryTile dbTile, CountryTile tile);
}

class CountryDetailsViewMapperImpl implements CountryDetailsViewMapper {
  @override
  CountryDetailsTile toCountryDetailsTile(
      CountryTile dbTile, CountryTile tile) {
    var tileNews = CountryDetailsTile();

    if (dbTile == null || dbTile.title == null) {
      tileNews = CountryDetailsTile(
        source: tile?.source,
        author: tile?.author,
        title: tile?.title,
        description: tile?.description,
        url: tile?.url,
        urlToImage: tile?.urlToImage,
        publishedAt: tile?.publishedAt,
        content: tile?.content,
        isFavourite: false,
      );
    } else {
      tileNews = CountryDetailsTile(
        source: dbTile?.source,
        author: dbTile?.author,
        title: dbTile?.title,
        description: dbTile?.description,
        url: dbTile?.url,
        urlToImage: dbTile?.urlToImage,
        publishedAt: dbTile?.publishedAt,
        content: dbTile?.content,
        isFavourite: true,
      );
    }

    return tileNews;
  }
}
