import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';
import 'package:url_launcher/url_launcher.dart';

import 'country_details_event.dart';

abstract class CountryDescriptionBloc {
  Sink<CountryDescriptionEvent> get counterEventSink;

  void dispose();
}

class CountryDescriptionBlocImpl extends CountryDescriptionBloc {
  /*static Dio dio = Dio();
  static ApiService _apiService = ApiServiceImpl(dio);
  static ApiCountryRepository _apiCountryRepository =
  ApiCountryRepositoryImpl(_apiService);
  static CountryMapper _countryMapper = CountryMapperImpl();
  final CountryInteractor _countryInteractor =
  CountryInteractorImpl(_apiCountryRepository, _countryMapper);*/

  //final CountryViewMapper _viewMapper = CountryViewMapperImpl();

/*  final list = List<CountryTile>();

  final _countryStateController = StreamController<dynamic>();

  StreamSink<dynamic> get _inCountry => _countryStateController.sink;

  Stream<dynamic> get country => _countryStateController.stream;*/

  Sink<CountryDescriptionEvent> get counterEventSink => _countryEventController.sink;

  final _countryEventController = StreamController<CountryDescriptionEvent>();

  CountryDescriptionBlocImpl() {
    _countryEventController.stream.listen(_mapEventToState);
    //_getCountryNews();
  }

  _getCountryNews() async {
   /* final countryNews = await _countryInteractor.getCountryNews();

    list.clear();
    list.addAll(
      _viewMapper.toItemList(countryNews),
    );

    _inCountry.add(list);*/
  }

  void _mapEventToState(CountryDescriptionEvent event) {
    if (event is OpenCountryDescriptionNews) {
      //_counter++;
      _launchURL(event.url);
    } else {
      //_counter--;
    }

    //_inCounter.add(_counter);
  }

  @protected
  _launchURL(
    String url,
  ) async {
    final isCanLaunch = await canLaunch(url);
    if (isCanLaunch) {
      await launch(url);
    }
  }

  @override
  void dispose() {
  /*  _countryStateController.close();*/
    _countryEventController.close();
  }
}