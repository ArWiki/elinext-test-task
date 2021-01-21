import 'dart:async';

import 'package:elinext_test_task/domain/base/tile/bloc_tile.dart';
import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class Bloc {
  Stream<BlocTile> get dataStream;

  Stream<String> get actionToLaunchStream;

  void initState();

  void dispose();
}

abstract class BlocImpl implements Bloc {
  @override
  Stream<BlocTile> get dataStream => _data.stream;

  @override
  Stream<String> get actionToLaunchStream => _actionToLaunch.stream;

  final _data = StreamController<BlocTile>();
  final _actionToLaunch = StreamController<String>();

  final _blocTile = BlocTile.init();

  @override
  void initState() {

  }

  @override
  void dispose() {
    _blocTile.dispose();
    _data.close();
    _actionToLaunch.close();
  }

  @protected
  Future<void> launchPayload(
    Function action, {
    Function(dynamic) error,
    bool showLoading = true,
  }) async {
    if (showLoading) {
      handleData(isLoading: true);
    }
    try {
      await action?.call();
    } catch (e) {
      error?.call(e);
    } finally {
      if (showLoading) {
        handleData(isLoading: false);
      }
    }
  }

  @protected
  void handleData({
    bool isLoading,
    dynamic data,
  }) {
    if (!_blocTile.isDispose) {
      _blocTile.updateParams(isLoading, data);
      _data.add(_blocTile.copy());
    }
  }

  @protected
  Future<void> handleLunch({
    String path,
    Uri uri,
  }) async {
    final url = isBlank(path) ? uri.toString() : path;
    final isCanLaunch = await canLaunch(url);
    if (isCanLaunch) {
      _actionToLaunch.add(url);
    } else {
      _actionToLaunch.add("error"); //todo need change
    }
  }
}
