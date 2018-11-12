import 'package:flutter/material.dart';
import 'package:redux_demo/Interface/film_api.dart';
import 'package:redux_demo/states/film.dart';

import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';

@immutable
class FilmState {
  List<Film> _films;
  get films => _films;

  FilmRequetState _requestSate;
  get requestSate => _requestSate;

  FilmState(this._films, this._requestSate);
  FilmState.initState() {
    _films = [];
    _requestSate = FilmRequetLoading();
  }
}

// Sync Action
enum FilmAction {
  IncrementAction
 }

class UpdateQuoteAction {
  List<Film> _films;
  List<Film> get films => _films;

  FilmRequetState _requestSate;
  FilmRequetState get requestSate => _requestSate;

  UpdateQuoteAction(this._films, this._requestSate);
}

// ThunkAction
ThunkAction<FilmState> getDatasQuote = (Store<FilmState> store) async {
  List<Film> films  = await FilmApi.internal().getFilms();
  print('ThunkAction------${films}');
  store.dispatch(
   new UpdateQuoteAction(films, FilmRequetDatas())
  );
};

FilmState filmReducer(FilmState state, action) {
  if (action == FilmAction.IncrementAction) {
    return state;
  } else if (action is UpdateQuoteAction) {
    FilmState newState = new FilmState(action.films, action._requestSate);
    return newState;
  } else {
    return state;
  }
}

class FilmRequetState {}

class FilmRequetLoading extends FilmRequetState {}

class FilmRequetError extends FilmRequetState {}

class FilmRequetNoTerm extends FilmRequetState {}

class FilmRequetDatas extends FilmRequetState {}
