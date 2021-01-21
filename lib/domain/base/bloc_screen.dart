import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bloc.dart';

abstract class BlocScreen extends StatefulWidget {}

abstract class BlocScreenState<BS extends BlocScreen, B extends Bloc>
    extends State<BS> {
  @protected
  var bloc;

  BlocScreenState(Bloc bl) {
    this.bloc = bl;
  }

  @override
  void initState() {
    bloc.actionToLaunchStream.listen((event) {
      launch(event);
    });

    super.initState();
    bloc.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
