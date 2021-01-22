import 'package:elinext_test_task/data/api/repository/db/db_country_details_repository.dart';
import 'package:elinext_test_task/domain/mapper/country_description_mapper.dart';
import 'package:elinext_test_task/presentation/screen/country/tile/country_tile.dart';

abstract class CountryDescriptionInteractor {
  Future<CountryTile> getNews(CountryTile tile);

  Future<int> insertNews(CountryTile tile);

  Future<int> deleteNews(CountryTile tile);
}

class CountryDescriptionInteractorImpl implements CountryDescriptionInteractor {
  final DbCountryDetailsRepository _dbRepository;
  final CountryDescriptionMapper _mapper;

  CountryDescriptionInteractorImpl(
      this._dbRepository,
      this._mapper,
      );

  @override
  Future<int> insertNews(CountryTile tile) async {
    return await _dbRepository.insert(_mapper.toMap(tile));
  }

  @override
  Future<int> deleteNews(CountryTile tile) async {
    return await _dbRepository.delete(tile);
  }

  @override
  Future<CountryTile> getNews(CountryTile tile) async {
    final response = await _dbRepository.get(tile);
    return _mapper.toCountryTile(response);
  }
}