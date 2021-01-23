import 'package:elinext_test_task/data/api/service/DbService.dart';
import 'package:elinext_test_task/data/utils/const.dart';
import 'package:sqflite/sqflite.dart';

abstract class DbCountryDetailsRepository {
  Future<List<Map<String, dynamic>>> get(String title);

  Future<int> insert(Map<String, dynamic> values);

  Future<int> delete(String title);
}

class DbCountryDetailsRepositoryImpl implements DbCountryDetailsRepository {
  final DbService _dbService;

  DbCountryDetailsRepositoryImpl(this._dbService);

  @override
  Future<List<Map<String, dynamic>>> get(String title) => _dbService.query(
        C.TABLE_COUNTRY,
        where: 'title = ?',
        whereArgs: [title],
      );

  @override
  Future<int> delete(String title) => _dbService.delete(
        C.TABLE_COUNTRY,
        where: 'title = ?',
        whereArgs: [title],
      );

  @override
  Future<int> insert(Map<String, dynamic> values) => _dbService.insert(
        C.TABLE_COUNTRY,
        values,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
}
