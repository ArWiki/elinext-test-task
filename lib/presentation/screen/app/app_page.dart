import 'package:elinext_test_task/domain/base/base_page.dart';
import 'package:flutter/material.dart';

class AppPage<T> extends BasePage<T> {
  const AppPage({
    @required LocalKey key,
    @required String name,
    @required WidgetBuilder builder,
    Object arguments,
    bool isShowAnim,
    this.isShowBottomNavBar = true,
  }) : super(
    key: key,
    name: name,
    builder: builder,
    arguments: arguments,
    isShowAnim: isShowAnim,
  );

  final bool isShowBottomNavBar;
}