import 'package:elinext_test_task/presentation/screen/app/app_module.dart';
import 'package:elinext_test_task/presentation/screen/country/country_module.dart';

initInjector() async {
  ///region country
  initAppModule();
  initCountryModule();

  ///endregion
}
