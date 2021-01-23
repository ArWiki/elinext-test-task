import 'package:elinext_test_task/data/api/service/DbService.dart';
import 'package:elinext_test_task/data/utils/const.dart';

abstract class DbCountryFavoritesRepository {
  Future<List<Map<String, dynamic>>> get(int countNews);
}

class DbCountryFavoritesRepositoryImpl implements DbCountryFavoritesRepository {
  final DbService _dbService;

  DbCountryFavoritesRepositoryImpl(this._dbService);

  @override
  Future<List<Map<String, dynamic>>> get(int countNews) => _dbService.query(
        C.TABLE_COUNTRY,
        limit: countNews,
      );
}
