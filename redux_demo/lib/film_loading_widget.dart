import 'package:flutter/material.dart';

class FilmLoadingWidget extends StatelessWidget {
  final bool visible;

  const FilmLoadingWidget({Key key, this.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: visible ? 1.0 : 0.0,
      child: Container(
        alignment: FractionalOffset.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
