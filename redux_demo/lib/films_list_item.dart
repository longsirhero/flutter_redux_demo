import 'package:flutter/material.dart';
import 'package:redux_demo/states/film.dart';


class FilmsListItem extends StatelessWidget {
  final Film film;

  FilmsListItem({@required this.film});

  @override
  Widget build(BuildContext context) {
    var title = Text(
      film?.title,
      style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    );

    var subTitle = Row(
      children: <Widget>[
        Icon(
          Icons.movie,
          color: Colors.cyan,
          size: 17.0,
        ),
        Container(
          margin: const EdgeInsets.only(left: 4.0),
          child: Text(
            film?.director,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );

    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          title: title,
          subtitle: subTitle,
        ),
        Divider(),
      ],
    );
  }
}