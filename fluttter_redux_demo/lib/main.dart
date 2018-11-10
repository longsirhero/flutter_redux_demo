import 'package:flutter/material.dart';

import 'package:fluttter_redux_demo/count_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:fluttter_redux_demo/top_screen.dart';
import 'package:fluttter_redux_demo/under_screen.dart';

void main() {
  final store =
      Store<CountState>(reducer, initialState: CountState.initState());
  runApp(new MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<CountState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(primarySwatch: Colors.blue),
        home: TopScreen(),
      ),
    );
  }
}
