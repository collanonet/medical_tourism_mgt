import 'dart:async';
import 'dart:convert';

import 'package:stomp_dart_client/stomp.dart';

import 'index.dart';

typedef Unsubscriber = Function({Map<String, String>? unsubscribeHeaders});

class StompChannel<T> {
  final StompTopic<T> topic;
  final _receiver = StreamController<T?>.broadcast();
  final _sender = StreamController<T>(sync: true);
  Unsubscriber? _unsubscriber;

  StreamSink<T> get sink => _sender.sink;
  Stream<T?> get stream => _receiver.stream;

  StompChannel({required this.topic});

  StompConnection<T> subscribe({required StompClient client}) {
    _subscribe(client: client);
    return StompConnection(channel: this);
  }

  void reconnect({required StompClient client}) {
    _subscribe(client: client);
  }

  void close() {
    _receiver.close();
    _sender.close();
    _unsubscriber?.call();
  }

  void _subscribe({required StompClient client}) {
    assert(client.connected);

    _unsubscriber = client.subscribe(
      destination: topic.endPoint,
      callback: (stompFrame) {
        final body = stompFrame.body;
        if (body == null) return;

        _receiver.add(
          topic.fromJson(jsonDecode(body)),
        );
      },
    );

    _sender.stream.listen((value) {
      client.send(
        destination: topic.endPoint,
        body: jsonEncode(topic.toJson(value)),
      );
    });
  }
}
