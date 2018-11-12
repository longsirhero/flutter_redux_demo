import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:redux_demo/states/film.dart';



class FilmApi {
  final _baseUrl = 'https://swapi.co/api';

  static final FilmApi _internal = FilmApi.internal();
  factory FilmApi() => _internal;
  FilmApi.internal();

  Future<dynamic> _getData(String url) async {
    var response = await http.get(url);
    var data = json.decode(response.body);
    return data;
  }

  Future<List<Film>> getFilms() async {
    var data = await _getData('$_baseUrl/films');
    List<dynamic> filmsData = data['results'];
    List<Film> films = filmsData.map((f) => Film.fromMap(f)).toList();
    return films;
  }
}
