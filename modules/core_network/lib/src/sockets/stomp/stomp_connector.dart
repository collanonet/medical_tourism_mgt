import 'dart:async';

import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';

class StompConnector {
  final Future<Map<String, String>> Function()? headers;
  final Uri uri;
  final void Function(StompClient)? onReconnected;
  final StompDebugCallback? onDebugMessage;

  StompConnector({
    required this.uri,
    this.headers,
    this.onReconnected,
    this.onDebugMessage,
  });

  Future<StompClient?> connect() async {
    final completer = Completer<StompClient?>();
    StompClient? client;

    onConnect(_) async {
      if (completer.isCompleted) {
        onReconnected?.call(await _createClient());
      } else {
        completer.complete(client);
      }
    }

    client = await _createClient(
      onConnect: onConnect,
      onWebSocketError: (_) async {
        client = await _createClient(onConnect: onConnect)
          ..activate();
      },
    )
      ..activate();

    return completer.future;
  }

  Future<StompClient> _createClient({
    StompFrameCallback? onConnect,
    StompWebSocketErrorCallback? onWebSocketError,
  }) async {
    final headers = await this.headers?.call();

    return StompClient(
      config: StompConfig.SockJS(
        url: uri.toString(),
        stompConnectHeaders: headers,
        webSocketConnectHeaders: headers,
        onConnect: onConnect ?? (_) {},
        onWebSocketError: onWebSocketError ?? (_) {},
        onDebugMessage: (msg) => onDebugMessage?.call(msg),
      ),
    );
  }
}
