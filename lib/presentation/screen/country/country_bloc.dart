import 'dart:async';
import 'package:dio/dio.dart';
import 'package:elinext_test_task/data/api/repository/api/api_country_repository.dart';
import 'package:elinext_test_task/data/api/service/ApiService.dart';
import 'package:elinext_test_task/domain/interactor/country_interactor.dart';
import 'package:elinext_test_task/domain/mapper/country_mapper.dart';
import 'package:elinext_test_task/presentation/utils/const.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
  static Dio dio = Dio();
  static ApiService _apiService = ApiServiceImpl(dio);
  static ApiCountryRepository _apiCountryRepository =
      ApiCountryRepositoryImpl(_apiService);
  static CountryMapper _countryMapper = CountryMapperImpl();
  final CountryInteractor _countryInteractor =
      CountryInteractorImpl(_apiCountryRepository, _countryMapper);

  final CountryViewMapper _viewMapper = CountryViewMapperImpl();

  final list = List<CountryTile>();

  final _countryStateController = StreamController<dynamic>();

  StreamSink<dynamic> get _inCountry => _countryStateController.sink;

  Stream<dynamic> get country => _countryStateController.stream;

  final _countryEventController = StreamController<CountryEvent>();

  Sink<CountryEvent> get countryEventSink => _countryEventController.sink;

  CountryBlocImpl() {
    _countryEventController.stream.listen(_mapEventToState);
    init();
    _getCountryNews();
  }

  init() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        compact: false,
      ),
    );
  }

  _getCountryNews() async {
    final countryNews = await _countryInteractor
        .getCountryNews(list.length + C.DEFAULT_COUNT_NEWS);

    list.clear();
    list.addAll(
      _viewMapper.toItemList(countryNews),
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
