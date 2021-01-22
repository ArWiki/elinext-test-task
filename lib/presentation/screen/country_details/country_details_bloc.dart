import 'dart:async';
import 'package:elinext_test_task/data/api/repository/db/db_country_details_repository.dart';
import 'package:elinext_test_task/data/api/service/DbService.dart';
import 'package:elinext_test_task/domain/interactor/country_description_interactor.dart';
import 'package:elinext_test_task/domain/mapper/country_description_mapper.dart';
import 'package:elinext_test_task/presentation/screen/country/tile/country_tile.dart';
import 'package:elinext_test_task/presentation/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:url_launcher/url_launcher.dart';
import 'country_details_event.dart';
import 'country_details_view_mapper.dart';
import 'tile/country_details_tile.dart';

abstract class CountryDescriptionBloc {
  Sink<CountryDetailsEvent> get countryDescriptionEventSink;

  StreamSink<dynamic> get _inCountryDetails;

  void init(CountryTile tile);

  void dispose();
}

class CountryDescriptionBlocImpl extends CountryDescriptionBloc {
  static Database db;
  static DbService _dbService;
  static DbCountryDetailsRepository _dbCountryDetailsRepository;
  static CountryDescriptionMapper _countryDescriptionMapper;
  static CountryDescriptionInteractor _countryDescriptionInteractor;

  var tileNews = CountryDetailsTile();

  final CountryDetailsViewMapper _viewMapper = CountryDetailsViewMapperImpl();

  final _countryStateController = StreamController<dynamic>();

  final _countryEventController = StreamController<CountryDetailsEvent>();

  Sink<CountryDetailsEvent> get countryDescriptionEventSink =>
      _countryEventController.sink;

  Stream<dynamic> get countryDetails => _countryStateController.stream;

  StreamSink<dynamic> get _inCountryDetails => _countryStateController.sink;

  CountryDescriptionBlocImpl() {
    //init();
    _countryEventController.stream.listen(_mapEventToState);
  }

  @override
  init(CountryTile tile) async {
    await openDatabase(C.DATABASE_NAME).then((value) => {
          db = value,
          _dbService = DbServiceImpl(db),
          _dbCountryDetailsRepository =
              DbCountryDetailsRepositoryImpl(_dbService),
          _countryDescriptionMapper = CountryDescriptionMapperImpl(),
          _countryDescriptionInteractor = CountryDescriptionInteractorImpl(
              _dbCountryDetailsRepository, _countryDescriptionMapper),
          //_viewMapper = CountryDetailsViewMapperImpl(),
          _checkInDb(tile),
        });
  }

  _checkInDb(CountryTile tile) async {
    final dbTile = await _countryDescriptionInteractor.getNews(tile);
    tileNews = _viewMapper.toCountryDetailsTile(dbTile, tile);
    _inCountryDetails.add(tileNews);
  }

  void _mapEventToState(CountryDetailsEvent event) {
    if (event is OpenCountryDetailsNews) {
      _launchURL(event.url);
    } else if (event is Init) {
      init(event.tile);
    } else if (event is Favourite) {
      _changeDataInDb(event.isFavourite);
    }
  }

  _changeDataInDb(bool isFavourite) async {
    if (isFavourite) {
      final dbTile = await _countryDescriptionInteractor.deleteNews(tileNews);
      tileNews.isFavourite = false;
    } else {
      final dbTile = await _countryDescriptionInteractor.insertNews(tileNews);
      tileNews.isFavourite = true;
    }
    _inCountryDetails.add(tileNews);
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
  Future<void> dispose() async {
    await db.close();
    _countryEventController.close();
    _countryStateController.close();
  }
}
