import 'dart:async';

import 'package:elinext_test_task/domain/interactor/country_favourites_interactor.dart';
import 'package:elinext_test_task/presentation/screen/country/tile/country_tile.dart';
import 'package:elinext_test_task/presentation/utils/const.dart';
import 'package:get_it/get_it.dart';
import 'country_favorites_event.dart';

abstract class CountryFavoritesBloc {
  Stream<dynamic> get countryFavorites;

  Sink<CountryFavoritesEvent> get countryFavoritesEventSink;

  StreamSink<dynamic> get _inCountryFavorites;

  init();

  void dispose();
}

class CountryFavoritesBlocImpl extends CountryFavoritesBloc {
  final list = List<CountryTile>();

  final _countryStateController = StreamController<dynamic>();

  final _countryEventController = StreamController<CountryFavoritesEvent>();

  @override
  StreamSink<dynamic> get _inCountryFavorites => _countryStateController.sink;

  @override
  Stream<dynamic> get countryFavorites => _countryStateController.stream;

  @override
  Sink<CountryFavoritesEvent> get countryFavoritesEventSink =>
      _countryEventController.sink;

  CountryFavoritesBlocImpl() {
    _countryEventController.stream.listen(_mapEventToState);
    init();
  }

  @override
  init() async {
    final dbList = await GetIt.I
        .get<CountryFavoritesInteractor>()
        .getNews(list.length + C.DEFAULT_COUNT_NEWS);

    list.clear();
    list.addAll(
      dbList,
    );

    _inCountryFavorites.add(list);
  }

  void _mapEventToState(CountryFavoritesEvent event) {
    if (event is OnCountryFavoritesRefresh) {
      init();
    }
  }

  @override
  void dispose() {
    _countryStateController.close();
    _countryEventController.close();
  }
}