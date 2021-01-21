import 'package:elinext_test_task/presentation/di/app_injector.dart';
import 'package:flutter/material.dart';

import 'presentation/screen/app/app.dart';
import 'presentation/screen/country/country_screen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await initInjector();

  runApp(CountryScreen());

}


