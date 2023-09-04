import 'dart:async';

import 'index.dart';

class StompConnection<T> {
  bool _alive = true;
  final StompChannel channel;
  bool get isAlive => _alive;

  StompConnection({required this.channel});

  void send(T message) {
    channel.sink.add(message);
  }

  Stream<T?> get stream {
    return channel.stream as Stream<T?>;
  }

  Future<void> close() async {
    _alive = false;
    return channel.close();
  }
}
