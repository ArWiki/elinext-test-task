import 'package:elinext_test_task/data/api/repository/api_country_repository.dart';
import 'package:elinext_test_task/domain/mapper/country_mapper.dart';
import 'package:elinext_test_task/domain/model/country/country.dart';

abstract class CountryInteractor {
  Future<Country> getCountryNews();
}

class CountryInteractorImpl implements CountryInteractor {
  final ApiCountryRepository _apiRepository;
  final CountryMapper _mapper;

  CountryInteractorImpl(
    this._apiRepository,
    this._mapper,
  );

  @override
  Future<Country> getCountryNews() async {
    final response = await _apiRepository.loadCountryNews();
    return _mapper.toCountry(response);
  }
}