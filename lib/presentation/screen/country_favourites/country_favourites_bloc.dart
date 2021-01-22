import 'dart:async';

import 'package:elinext_test_task/data/api/repository/db/db_country_favourites_repository.dart';
import 'package:elinext_test_task/data/api/service/DbService.dart';
import 'package:elinext_test_task/domain/interactor/country_favourites_interactor.dart';
import 'package:elinext_test_task/domain/mapper/country_favourites_mapper.dart';
import 'package:elinext_test_task/presentation/screen/country/tile/country_tile.dart';
import 'package:elinext_test_task/presentation/utils/const.dart';
import 'package:sqflite/sqflite.dart';

import 'country_favourites_event.dart';

abstract class CountryFavouritesBloc {
  Stream<dynamic> get countryFavourites;

  Sink<CountryFavouritesEvent> get countryFavouritesEventSink;

  init();

  void dispose();
}

class CountryFavouritesBlocImpl extends CountryFavouritesBloc {
  static Database db;
  static DbService _dbService;
  static DbCountryFavouritesRepository _dbCountryFavouritesRepository;
  static CountryFavouritesMapper _countryFavouritesMapper;
  static CountryFavouritesInteractor _countryFavouritesInteractor;


  final list = List<CountryTile>();

  final _countryStateController = StreamController<dynamic>();

  StreamSink<dynamic> get _inCountryFavourites => _countryStateController.sink;

  Stream<dynamic> get countryFavourites => _countryStateController.stream;

  final _countryEventController = StreamController<CountryFavouritesEvent>();

  Sink<CountryFavouritesEvent> get countryFavouritesEventSink =>
      _countryEventController.sink;

  CountryFavouritesBlocImpl() {
    _countryEventController.stream.listen(_mapEventToState);
    init();
  }

  @override
  init() async {
    await openDatabase(C.DATABASE_NAME).then((value) => {
          db = value,
          _dbService = DbServiceImpl(db),
          _dbCountryFavouritesRepository =
              DbCountryFavouritesRepositoryImpl(_dbService),
          _countryFavouritesMapper = CountryFavouritesMapperImpl(),
          _countryFavouritesInteractor = CountryFavouritesInteractorImpl(
              _dbCountryFavouritesRepository, _countryFavouritesMapper),
          _checkInDb(),
        });
  }

  _checkInDb() async {
    final dbList = await _countryFavouritesInteractor
        .getNews(list.length + C.DEFAULT_COUNT_NEWS);

    list.clear();
    list.addAll(
      dbList,
    );

    _inCountryFavourites.add(list);
  }

  void _mapEventToState(CountryFavouritesEvent event) {
    if (event is OnCountryFavouritesRefresh) {
      init();
    }
  }

  @override
  void dispose() {
    _countryStateController.close();
    _countryEventController.close();
  }
}
