import 'dart:async';

class MyValue<T> {
  T _value;
  StreamController<T> _result = StreamController<T>();

  MyValue(this._value);

  T get get => _value;

  void set(T str) => {_value = str, _result.add(str)};

  Stream<T> get stream => _result.stream;

  Type get type => T;
}
