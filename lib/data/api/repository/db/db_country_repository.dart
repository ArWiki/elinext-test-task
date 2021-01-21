import 'package:elinext_test_task/data/api/service/DbService.dart';
import 'package:elinext_test_task/presentation/screen/country/tile/country_tile.dart';

abstract class DbCountryRepository {
  Future<List<Map<String, dynamic>>> get();
  Future<int> insert(CountryTile tile);
  Future<int> update(CountryTile tile);
  Future<int> delete(CountryTile tile);
}

class DbCountryRepositoryImpl implements DbCountryRepository {
  final DbService _dbService;

  DbCountryRepositoryImpl(this._dbService);

  @override
  Future<ApiLoadCountryResponse> loadCountryNews() => _dbService
      .get(C.getCountry(5))
      .then((value) => ApiLoadCountryResponse.fromJson(value.data));

  @override
  Future<int> delete(CountryTile tile) => _dbService.delete(table)

  @override
  Future<List<Map<String, >>> get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<int> insert(CountryTile tile) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<int> update(CountryTile tile) {
    // TODO: implement update
    throw UnimplementedError();
  }
}