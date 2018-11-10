import 'package:meta/meta.dart';

/// State中所有属性都应该是只读的
@immutable
class CountState {
  int _count;
  get count => _count;

  CountState(this._count);
  CountState.initState(){
    _count = 0;
  }
}

/// 这里只有增加count一个动作
enum Action { increment }

/// reducer会根据传进来的action生成新的CountState
CountState reducer(CountState state, action) {
  // 匹配Action
  if (action == Action.increment) {
    return CountState(state._count + 1);
  }
  return state;
}
