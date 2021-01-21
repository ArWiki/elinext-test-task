import 'dart:async';
import 'package:bloc/bloc.dart';
import 'test_extras.dart';

class TestBloc extends Bloc<TestEvent, TestState> {

  @override
  TestState get initialState => TestState();

  @override
  Stream<TestState> mapEventToState(TestEvent event) async* {}

}
