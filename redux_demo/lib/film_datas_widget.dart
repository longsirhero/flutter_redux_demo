import 'package:flutter/material.dart';

import 'package:redux_demo/films_list_item.dart';
import 'package:redux_demo/states/film.dart';

class FilmDatasWidget extends StatelessWidget {
  final List<Film> items;
  final bool visible;

  FilmDatasWidget({Key key, @required this.items, bool visible})
      : this.visible = visible ?? items.isNotEmpty,
        super(key: key);

   @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: visible ? 1.0 : 0.0,
      child:  ListView.builder(
      itemCount: items.length,
      itemBuilder: (_, index) {
        return FilmsListItem(
          film: items[index],
        );
      },
      ),
    );
  }
}
