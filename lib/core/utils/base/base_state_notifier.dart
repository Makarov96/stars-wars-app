import 'package:flutter_riverpod/flutter_riverpod.dart';

enum STATUSOFDATA { init, failure, success, loading }

abstract class BaseStateNotifier<T> extends StateNotifier<T> {
  STATUSOFDATA statusofdata = STATUSOFDATA.init;

  BaseStateNotifier(T state) : super(state);
}
