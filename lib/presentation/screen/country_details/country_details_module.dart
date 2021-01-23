import 'package:elinext_test_task/data/api/repository/db/db_country_details_repository.dart';
import 'package:elinext_test_task/domain/interactor/country_description_interactor.dart';
import 'package:elinext_test_task/domain/mapper/country_description_mapper.dart';
import 'package:get_it/get_it.dart';

import 'country_details_bloc.dart';
import 'country_details_view_mapper.dart';

initCountryDetailsModule() {
  GetIt.I.registerFactory<CountryDetailsBloc>(
        () => CountryDetailsBlocImpl(),
  );
  GetIt.I.registerFactory<CountryDescriptionMapper>(
        () => CountryDescriptionMapperImpl(),
  );
  GetIt.I.registerFactory<CountryDetailsViewMapper>(
        () => CountryDetailsViewMapperImpl(),
  );
  GetIt.I.registerFactory<DbCountryDetailsRepository>(
        () =>
        DbCountryDetailsRepositoryImpl(
          GetIt.I.get(),
        ),
  );
  GetIt.I.registerFactory<CountryDescriptionInteractor>(
        () =>
        CountryDescriptionInteractorImpl(
          GetIt.I.get(),
          GetIt.I.get(),
        ),
  );
}