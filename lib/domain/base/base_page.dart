import 'package:flutter/material.dart';

abstract class BasePage<T> extends Page<T> {
  const BasePage({
    @required LocalKey key,
    @required String name,
    @required this.builder,
    Object arguments,
    this.isShowAnim,
  }) : super(key: key, name: name, arguments: arguments);

  final WidgetBuilder builder;
  final bool isShowAnim;

  @override
  Route<T> createRoute(BuildContext context) => _AppRoute(
    settings: this,
    builder: builder,
    isShowAnim: isShowAnim,
  );

  @override
  String toString() => '$name';
}

class _AppRoute<T> extends MaterialPageRoute<T> {
  final bool isShowAnim;

  _AppRoute({
    WidgetBuilder builder,
    RouteSettings settings,
    this.isShowAnim = true,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    if (!(isShowAnim??true)) {
      return child;
    }
    return Theme.of(context).pageTransitionsTheme.buildTransitions<T>(
      this,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}