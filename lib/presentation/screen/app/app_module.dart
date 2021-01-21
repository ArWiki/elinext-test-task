import 'package:dio/dio.dart';
import 'package:elinext_test_task/data/api/repository/api/api_country_repository.dart';
import 'package:elinext_test_task/data/api/service/ApiService.dart';
import 'package:elinext_test_task/domain/base/bloc.dart';
import 'package:elinext_test_task/domain/interactor/country_interactor.dart';
import 'package:elinext_test_task/domain/mapper/country_mapper.dart';
import 'package:elinext_test_task/presentation/screen/app/app_bloc.dart';
import 'package:elinext_test_task/presentation/screen/country/country_bloc.dart';
import 'package:elinext_test_task/presentation/screen/country/country_view_mapper.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

initAppModule() {
  //GetIt.I.registerSingleton<AppBloc>(AppBlocImpl());
  GetIt.I.registerFactory<AppBloc>(
        () => AppBlocImpl(),
  );
}

