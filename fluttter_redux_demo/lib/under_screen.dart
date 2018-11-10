import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttter_redux_demo/count_state.dart';

class UnderScreen extends StatefulWidget {
  @override
  _UnderScreenState createState() {
    // TODO: implement createState
    return _UnderScreenState();
  }
}

class _UnderScreenState extends State<UnderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Under Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            StoreConnector<CountState, int>(
              converter: (store) => store.state.count,
              builder: (context, count) {
                return Text(count.toString(),
                    style: Theme.of(context).textTheme.display1);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: StoreConnector<CountState, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(Action.increment);
        },
        builder: (context, callBack) {
          return FloatingActionButton(
            onPressed: callBack,
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
