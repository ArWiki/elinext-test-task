import 'package:elinext_test_task/domain/base/bloc.dart';
import 'tile/AppTile.dart';

abstract class AppBloc extends Bloc {
}

class AppBlocImpl extends BlocImpl implements AppBloc {

  final _appTile = AppTile.init();

  @override
  void initState() {
    super.initState();

    _updateData();
  }

  _updateData() {
    handleData(data: _appTile);
  }
}
