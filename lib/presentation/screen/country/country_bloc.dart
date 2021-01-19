import 'package:elinext_test_task/domain/interactor/country_interactor.dart';

import 'country_view_mapper.dart';

abstract class CountryBlock {

}

class CountryBlockImpl implements CountryBlock {
  final CountryInteractor _countryInteractor;
  final CountryViewMapperImpl _viewMapper;

  CountryBlockImpl(this._countryInteractor, this._viewMapper);
}