import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_demo/states/film_state.dart';

import 'package:redux_demo/film_loading_widget.dart';
import 'package:redux_demo/film_nodata_widget.dart';
import 'package:redux_demo/film_error_widget.dart';
import 'package:redux_demo/film_datas_widget.dart';
import 'package:redux_thunk/redux_thunk.dart';

class FilmPage extends StatefulWidget {
  
  @override
  _FilmPageSate createState() {
    return new _FilmPageSate();
  }
}

class _FilmPageSate extends State<FilmPage> {

  @override
  void initState() {
    super.initState();

    print('init state');
    // StoreProvider.of< FilmState>(context).dispatch(getDatasQuote);

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
    StoreProvider.of< FilmState>(context).dispatch(getDatasQuote);
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('redux'),
      ),
      body: StoreConnector<FilmState, FilmState>(
        converter: (store) {
          return store.state;
        },
        builder: (context, storestate) {
          print('${storestate.films}, ${storestate.requestSate}');
          return Container(
            child: Stack(
              children: <Widget>[
                FilmNoDataWidget(
                  visible: storestate.requestSate is FilmRequetNoTerm,
                ),
                FilmLoadingWidget(
                  visible: storestate.requestSate is FilmRequetLoading,
                ),
                FilmErrorWidget(
                  visible: storestate.requestSate is FilmRequetError,
                ),
                FilmDatasWidget(
                  items: storestate.films,
                  visible: storestate.requestSate is FilmRequetDatas,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
