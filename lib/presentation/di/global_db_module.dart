import 'package:elinext_test_task/data/api/service/DbService.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

initGlobalDbModule(Database database) {
  GetIt.I.registerFactory<DbService>(
    () => DbServiceImpl(
      database,
    ),
  );
}
