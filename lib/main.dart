import 'package:flutter/material.dart';
import 'presentation/screen/country/country_screen.dart';
import 'presentation/screen/router/app_router.dart';

Future<void> main() async {
// Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();

  //await initInjector();

  runApp(App(AppRouter()));
}

class App extends StatelessWidget {
  final AppRouter appRouter;

  App(this.appRouter);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
