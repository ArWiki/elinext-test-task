import 'package:equatable/equatable.dart';

abstract class TestEvent extends Equatable {}

class TestState {

  TestState();

  factory TestState.fromPrev({@required TestState prevState}) {
    if (prevState == null) {
      return TestState();
    } else {
      return TestState();
    }
  }
}