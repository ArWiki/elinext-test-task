import 'dart:async';
import 'package:elinext_test_task/domain/interactor/country_interactor.dart';
import 'package:elinext_test_task/presentation/utils/const.dart';
import 'package:get_it/get_it.dart';
import 'country_event.dart';
import 'country_view_mapper.dart';
import 'tile/country_tile.dart';

abstract class CountryBloc {
  StreamSink<dynamic> get _inCountry;

  Stream<dynamic> get country;

  Sink<CountryEvent> get countryEventSink;

  void dispose();
}

class CountryBlocImpl extends CountryBloc {
  final list = List<CountryTile>();

  final _countryStateController = StreamController<dynamic>();

  final _countryEventController = StreamController<CountryEvent>();

  @override
  StreamSink<dynamic> get _inCountry => _countryStateController.sink;

  @override
  Stream<dynamic> get country => _countryStateController.stream;

  @override
  Sink<CountryEvent> get countryEventSink => _countryEventController.sink;

  CountryBlocImpl() {
    _countryEventController.stream.listen(_mapEventToState);
    _getCountryNews();
  }

  _getCountryNews() async {
    final countryNews = await GetIt.I
        .get<CountryInteractor>()
        .getCountryNews(list.length + C.DEFAULT_COUNT_NEWS);

    list.clear();
    list.addAll(
      GetIt.I.get<CountryViewMapper>().toItemList(countryNews),
    );

    _inCountry.add(list);
  }

  void _mapEventToState(CountryEvent event) {
    if (event is OnCountryRefresh) {
      _getCountryNews();
    }
  }

  @override
  void dispose() {
    _countryStateController.close();
    _countryEventController.close();
  }
}
