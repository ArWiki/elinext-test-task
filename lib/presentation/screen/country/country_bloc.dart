import 'dart:async';
import 'package:dio/dio.dart';
import 'package:elinext_test_task/data/api/repository/api/api_country_repository.dart';
import 'package:elinext_test_task/data/api/service/ApiService.dart';
import 'package:elinext_test_task/domain/interactor/country_interactor.dart';
import 'package:elinext_test_task/domain/mapper/country_mapper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'country_event.dart';
import 'country_view_mapper.dart';
import 'tile/country_tile.dart';

// abstract class CountryBloc {
//   StreamSink<dynamic> get _inCountry;
//
//   Stream<dynamic> get country;
//
//   Sink<CountryEvent> get counterEventSink;
//
//   void dispose();
// }

class CountryBloc  {
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

  Sink<CountryEvent> get counterEventSink => _countryEventController.sink;

  CountryBloc() {
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
    final countryNews = await _countryInteractor.getCountryNews();

    list.clear();
    list.addAll(
      _viewMapper.toItemList(countryNews),
    );

    _inCountry.add(list);
  }

  void _mapEventToState(CountryEvent event) {
    if (event is OpenCountryDescription) {
      //_counter++;
    } else {
      //_counter--;
    }

    //_inCounter.add(_counter);
  }

  @override
  void dispose() {
    _countryStateController.close();
    _countryEventController.close();
  }
}
