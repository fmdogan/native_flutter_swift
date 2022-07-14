import 'dart:async';

class MyValue<T> {
  T _value;
  StreamController<T> _streamer = StreamController<T>();

  MyValue(this._value);

  T get get => _value;

  void set(T str) => {_value = str, _streamer.add(str)};

  Stream<T> get stream => _streamer.stream;

  Type get type => T;
}
