import 'package:elinext_test_task/domain/base/base_page.dart';
import 'package:elinext_test_task/presentation/screen/country/country_screen.dart';

class AppTile {
  final List<BasePage> pages;

  AppTile(
    this.pages,
  );

  factory AppTile.init() {
    final pages = List<BasePage>.from([CountryScreen.page()]);
    final tile = AppTile(pages);
    return tile;
  }
}
