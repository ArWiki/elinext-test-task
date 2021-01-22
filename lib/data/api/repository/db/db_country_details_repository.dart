import 'package:elinext_test_task/data/api/service/DbService.dart';
import 'package:elinext_test_task/data/utils/const.dart';
import 'package:elinext_test_task/presentation/screen/country/tile/country_tile.dart';
import 'package:sqflite/sqflite.dart';

abstract class DbCountryDetailsRepository {
  Future<List<Map<String, dynamic>>> get(CountryTile tile);

  Future<int> insert(Map<String, dynamic> values);

  Future<int> delete(CountryTile tile);
}

class DbCountryDetailsRepositoryImpl implements DbCountryDetailsRepository {
  final DbService _dbService;

  DbCountryDetailsRepositoryImpl(this._dbService);

  @override
  Future<List<Map<String, dynamic>>> get(CountryTile tile) => _dbService.query(
    C.TABLE_COUNTRY,
    where: 'title = ?',
    whereArgs: [tile.title],
  );

  @override
  Future<int> delete(CountryTile tile) => _dbService.delete(
        C.TABLE_COUNTRY,
        where: 'title = ?',
        whereArgs: [tile.title],
      );

  @override
  Future<int> insert(Map<String, dynamic> values) => _dbService.insert(
        C.TABLE_COUNTRY,
        values,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
}
