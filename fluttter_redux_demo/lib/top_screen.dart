import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttter_redux_demo/count_state.dart';
import 'package:fluttter_redux_demo/under_screen.dart';

class TopScreen extends StatefulWidget {
  _TopScrenState createState() => _TopScrenState();
}

class _TopScrenState extends State<TopScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Top Screen'),
        ),
        body: Center(
            child: StoreConnector<CountState, int>(
                converter: (store) => store.state.count,
                builder: (context, count) {
                  return Text(
                    count.toString(),
                    style: Theme.of(context).textTheme.display1,
                  );
                })),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return UnderScreen();
            }));
          },
          child: Icon( Icons.forward),
        ));
  }
}
