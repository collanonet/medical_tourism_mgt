class WebSocketClient {
  const WebSocketClient({required this.webSocketUrl, this.headers});

  final Uri webSocketUrl;
  final Future<Map<String, String>> Function()? headers;
}
