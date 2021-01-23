import 'package:elinext_test_task/data/api/repository/db/db_country_favourites_repository.dart';
import 'package:elinext_test_task/domain/mapper/country_favourites_mapper.dart';
import 'package:elinext_test_task/presentation/screen/country/tile/country_tile.dart';

abstract class CountryFavoritesInteractor {
  Future<List<CountryTile>> getNews(int countNews);
}

class CountryFavoritesInteractorImpl implements CountryFavoritesInteractor {
  final DbCountryFavoritesRepository _dbRepository;
  final CountryFavoritesMapper _mapper;

  CountryFavoritesInteractorImpl(
    this._dbRepository,
    this._mapper,
  );

  @override
  Future<List<CountryTile>> getNews(int countNews) async {
    final response = await _dbRepository.get(countNews);
    return _mapper.toListCountryTile(response);
  }
}
