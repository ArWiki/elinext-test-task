import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'test_bloc.dart';

// Uncomment if you use injector package.
// import 'package:my_app/framework/di/injector.dart';

class Test extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return TestState();
  }
}

class TestState extends State<Test> {

  // Insert into injector file if you use it.
  // injector.map<TestBloc>((i) => TestBloc(i.get<Repository>()), isSingleton: true);

  // Uncomment if you use injector.
  // final _bloc = injector.get<TestBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}