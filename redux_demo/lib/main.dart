import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_demo/states/film_state.dart';
import 'package:redux_demo/film_widget.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  final store =
      Store<FilmState>(filmReducer, middleware: [thunkMiddleware],initialState: FilmState.initState());
  runApp(new MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<FilmState> store;

  MyApp(this.store);

  @override
    Widget build(BuildContext context) {
      return StoreProvider< FilmState>(
         store: store,
         child: new MaterialApp(
           title: 'Flutter Demo',
           theme: new ThemeData(
             primarySwatch: Colors.blue
           ),
           home: FilmPage(),
         ),
      );
    }

}
