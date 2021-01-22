import 'package:elinext_test_task/data/api/model/country/api_load_country_response.dart';
import 'package:elinext_test_task/data/api/service/ApiService.dart';
import 'package:elinext_test_task/data/utils/const.dart';

abstract class ApiCountryRepository {
  Future<ApiLoadCountryResponse> loadCountryNews(int countNews);
}

class ApiCountryRepositoryImpl implements ApiCountryRepository {
  final ApiService _apiService;

  ApiCountryRepositoryImpl(this._apiService);

  @override
  Future<ApiLoadCountryResponse> loadCountryNews(int countNews) => _apiService
      .get(C.getCountry(countNews))
      .then((value) => ApiLoadCountryResponse.fromJson(value.data));
}
