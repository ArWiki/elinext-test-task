import 'package:dio/dio.dart';
import 'package:elinext_test_task/data/api/repository/api/api_country_repository.dart';
import 'package:elinext_test_task/data/api/service/ApiService.dart';
import 'package:elinext_test_task/domain/interactor/country_interactor.dart';
import 'package:elinext_test_task/domain/mapper/country_mapper.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'country_bloc.dart';
import 'country_view_mapper.dart';

initCountryModule() {
  // GetIt.I.registerSingleton<ApiCountryRepository>(ApiCountryRepositoryImpl(
  //   GetIt.I.get(),
  // ));
  // GetIt.I.registerSingleton<ApiService>(ApiServiceImpl(
  //   _dioBuilder,
  // ));

  GetIt.I.registerFactory<ApiService>(
    () => ApiServiceImpl(
      _dioBuilder(),
    ),
  );
  GetIt.I.registerFactory<CountryViewMapper>(
    () => CountryViewMapperImpl(),
  );
  GetIt.I.registerFactory<CountryMapper>(
    () => CountryMapperImpl(),
  );
  GetIt.I.registerFactory<ApiCountryRepository>(
    () => ApiCountryRepositoryImpl(
      GetIt.I.get(),
    ),
    instanceName: 'ApiCountryRepository',
  );
  GetIt.I.registerFactory<CountryInteractor>(
    () => CountryInteractorImpl(
      GetIt.I.get(instanceName: 'ApiCountryRepository'),
      GetIt.I.get(),
    ),
  );
  GetIt.I.registerFactory<CountryBloc>(
    () => CountryBlocImpl(
      GetIt.I.get(),
      GetIt.I.get(),
    ),
  );
}

_dioBuilder({
  int timeout = 60000,
}) {
  final options = BaseOptions(
    connectTimeout: timeout,
    receiveTimeout: timeout,
    sendTimeout: timeout,
  );
  final dio = Dio(options);

  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    compact: false,
  ));

  return dio;
}
