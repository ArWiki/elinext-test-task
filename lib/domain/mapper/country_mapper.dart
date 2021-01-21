import 'package:elinext_test_task/data/api/model/country/api_load_country_response.dart';
import 'package:elinext_test_task/domain/model/country/country.dart';

abstract class CountryMapper {
  Country toCountry(ApiLoadCountryResponse response);
}

class CountryMapperImpl implements CountryMapper {
  @override
  Country toCountry(ApiLoadCountryResponse response) {
    final data = response;
    final list = List<CountryArticles>();
    response?.articles?.forEach((element) {
      list.add(
        CountryArticles(
          CountryArticlesSource(
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
    });
    return Country(
      data?.status,
      data?.totalResults,
      list,
    );
  }
}
