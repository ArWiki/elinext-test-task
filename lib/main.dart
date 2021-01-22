import 'package:elinext_test_task/presentation/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'presentation/screen/country/country_screen.dart';
import 'presentation/screen/router/app_router.dart';

Future<void> main() async {
// Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();

  //await initInjector();

  await _initDatabase();

  runApp(App(AppRouter()));
}

_initDatabase() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, C.DATABASE_NAME);
  Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(C.TABLE_INIT);
  });
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
