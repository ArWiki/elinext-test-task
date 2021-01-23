import 'package:elinext_test_task/data/api/repository/db/db_country_details_repository.dart';
import 'package:elinext_test_task/domain/mapper/country_description_mapper.dart';
import 'package:elinext_test_task/presentation/screen/country/tile/country_tile.dart';

abstract class CountryDescriptionInteractor {
  Future<CountryTile> getNews(String title);

  Future<int> insertNews(CountryTile tile);

  Future<int> deleteNews(String title);
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
  Future<int> deleteNews(String title) async {
    return await _dbRepository.delete(title);
  }

  @override
  Future<CountryTile> getNews(String title) async {
    final response = await _dbRepository.get(title);
    return _mapper.toCountryTile(response);
  }
}
