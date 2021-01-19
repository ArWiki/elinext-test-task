import 'package:elinext_test_task/data/api/model/country/api_load_country_response.dart';
import 'package:elinext_test_task/domain/model/country/country.dart';

abstract class CountryMapper {
  Country toCountry(ApiLoadCountryResponse response);
}

class CountryMapperImpl implements CountryMapper {
  @override
  Country toCountry(ApiLoadCountryResponse response) {
    final data = response;
    final dataArticles = response.articles;
    final dataArticlesSource = response.articles.source;
    return Country(
      data?.status,
      data?.totalResults,
      CountryArticles(
          CountryArticlesSource(
            dataArticlesSource?.id,
            dataArticlesSource?.name,
          ),
          dataArticles?.author,
          dataArticles?.title,
          dataArticles?.description,
          dataArticles?.url,
          dataArticles?.urlToImage,
          dataArticles?.publishedAt,
          dataArticles?.content,
      ),
    );
  }
}
