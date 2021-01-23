import 'package:elinext_test_task/data/api/repository/api/api_country_repository.dart';
import 'package:elinext_test_task/domain/interactor/country_interactor.dart';
import 'package:elinext_test_task/domain/mapper/country_mapper.dart';
import 'package:get_it/get_it.dart';
import 'country_bloc.dart';
import 'country_view_mapper.dart';

initCountryModule() {
  GetIt.I.registerFactory<ApiCountryRepository>(
    () => ApiCountryRepositoryImpl(
      GetIt.I.get(),
    ),
  );
  GetIt.I.registerFactory<CountryMapper>(
    () => CountryMapperImpl(),
  );
  GetIt.I.registerFactory<CountryViewMapper>(
    () => CountryViewMapperImpl(),
  );
  GetIt.I.registerFactory<CountryBloc>(
    () => CountryBlocImpl(),
  );
  GetIt.I.registerFactory<CountryInteractor>(
    () => CountryInteractorImpl(
      GetIt.I.get(),
      GetIt.I.get(),
    ),
  );
}
