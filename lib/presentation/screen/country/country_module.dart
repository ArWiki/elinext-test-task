import 'package:get_it/get_it.dart';

import 'country_bloc.dart';

initCountryModule() {
  GetIt.I.registerFactory<CountryBlock>(
    () => CountryBlockImpl(
      GetIt.I.get(),
      GetIt.I.get(),
    ),
  );
}
