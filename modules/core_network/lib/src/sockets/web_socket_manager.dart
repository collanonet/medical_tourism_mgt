import 'dart:async';

import 'package:core_utils/core_utils.dart';
import 'package:injectable/injectable.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:synchronized/synchronized.dart';

import 'stomp/index.dart';
import 'web_socket_client.dart';

@singleton
class WebSocketManager {
  final Map<StompTopic, StompConnection> _connections = {};
  final _lock = Lock();

  StompClient? stompClient;
  final WebSocketClient webSocketClient;

  WebSocketManager({
    required this.webSocketClient,
  });

  Future<StompConnection<T>> connect<T>({
    required StompTopic<T> topic,
  }) async {
    return _lock.synchronized<StompConnection<T>>(() async {
      final connection = _connections[topic];
      if (connection != null && connection.isAlive) {
        return Future.value(connection as StompConnection<T>);
      }

      if (stompClient == null || !stompClient!.connected) {
        final connector = StompConnector(
          uri: webSocketClient.webSocketUrl,
          headers: webSocketClient.headers,
          onReconnected: _onReconnected,
          onDebugMessage: (msg) => logger.d(msg),
        );
        stompClient = await connector.connect();
      }

      final channel = StompChannel<T>(topic: topic).subscribe(
        client: stompClient as StompClient,
      );
      _connections[topic] = channel;

      return channel;
    });
  }

  Future<void>? disconnect<T>({StompTopic<T>? topic}) async {
    if (topic == null) {
      return;
    }
    final connection = _connections.remove(topic);
    return connection?.close();
  }

  Future<void> close() async {
    for (var connection in _connections.values) {
      await connection.close();
    }
    _connections.clear();
    stompClient?.deactivate();
  }

  void _onReconnected(StompClient client) {
    stompClient = client;
    if (_connections.isEmpty) {
      close();
    } else {
      for (var connection in _connections.values) {
        connection.channel.reconnect(client: client);
      }
    }
  }
}
