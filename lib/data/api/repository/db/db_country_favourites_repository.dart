import 'package:elinext_test_task/data/api/service/DbService.dart';
import 'package:elinext_test_task/data/utils/const.dart';
import 'package:elinext_test_task/presentation/screen/country/tile/country_tile.dart';

abstract class DbCountryFavouritesRepository {
  Future<List<Map<String, dynamic>>> get(int countNews);
}

class DbCountryFavouritesRepositoryImpl implements DbCountryFavouritesRepository {
  final DbService _dbService;

  DbCountryFavouritesRepositoryImpl(this._dbService);

  @override
  Future<List<Map<String, dynamic>>> get(int countNews) => _dbService.query(
    C.TABLE_COUNTRY,
    limit: countNews,
  );
}