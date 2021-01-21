import 'package:elinext_test_task/domain/base/bloc.dart';
import 'package:elinext_test_task/domain/interactor/country_interactor.dart';

import 'country_view_mapper.dart';

abstract class CountryBloc extends Bloc {
  void handleRefresh();
}

class CountryBlocImpl extends BlocImpl implements CountryBloc {
  final CountryInteractor _countryInteractor;
  final CountryViewMapperImpl _viewMapper;

  final _tiles = List();

  CountryBlocImpl(
    this._countryInteractor,
    this._viewMapper,
  );

  @override
  void initState() {
    super.initState();

    handleRefresh();
  }

  @override
  void handleRefresh() {
    launchPayload(() async {
      await _getCountryNews();

      _updateData();
    }, error: (e) {
      _updateData();
    });
  }

  _getCountryNews() async {
    final countryNews = await _countryInteractor.getCountryNews();

    _tiles.clear();
    //_tiles.addAll(iterable)
  }

  _updateData() {
    handleData(data: _tiles.isEmpty ? "" : _tiles); //todo change ""
  }
}
