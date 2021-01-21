import 'package:elinext_test_task/domain/base/bloc.dart';
import 'package:elinext_test_task/domain/base/tile/bloc_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:elinext_test_task/domain/base/bloc_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import 'app_bloc.dart';
import 'tile/AppTile.dart';

class App extends StatelessWidget {
  @override
  Widget build(context) => _AppScreen();
}

class _AppScreen extends BlocScreen {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends BlocScreenState<_AppScreen, AppBloc> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  _AppScreenState() : super(GetIt.I.get<AppBloc>());

  @override
  Widget build(context) => MaterialApp(
        title: "Test",
        //navigatorKey: globalRootNavKey,
        //theme: AppTheme.primaryTheme(),
        //locale: AppLocales.ruLocale,
        localizationsDelegates: [
          //AppLocales.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        //supportedLocales: [AppLocales.ruLocale],
        home: _home(),
      );

  _home() => LayoutBuilder(
        builder: (ctx, constraints) {
          //bloc.handleViewInsetsBottom(MediaQuery.of(ctx).viewInsets.bottom);

          return StreamBuilder<BlocTile>(
            stream: bloc.dataStream,
            builder: (context, result) {
              final data = result?.data?.data;

              if (data is AppTile) {
                return _content(ctx, data);
              }
              return Container(
                height: 0.0,
                width: 0.0,
              );
            },
          );
        },
      );

  _content(BuildContext ctx, AppTile tile) => Scaffold(
        body: WillPopScope(
          onWillPop: () async => !await _navigatorKey.currentState.maybePop(),
          child: Stack(
            children: [
              Navigator(
                key: _navigatorKey,
                onPopPage: (Route<dynamic> route, dynamic result) {
                  //bloc.handleRemoveRouteSettings(route.settings);
                  return route.didPop(result);
                },
                pages: tile.pages.toList(),
              ),
              //_bottomNavBarIndicator(ctx, tile),
            ],
          ),
        ),
      );
}
