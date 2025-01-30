import 'package:core_utils/core_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

@injectable
class SocketService {
  static final SocketService _instance = SocketService._internal();

  late IO.Socket _socket;
  bool _isConnected = false;

  // Expose connection status
  bool get isConnected => _isConnected;

  factory SocketService() => _instance;

  SocketService._internal();

  // Connect to the Socket.IO server
  void connect({required String userId}) {
    logger.d('Connecting to Socket.IO server');
    try {
      _socket = IO.io(
        GetIt.I<Uri>(instanceName: 'baseUrl').toString(),
        IO.OptionBuilder()
            .setTransports(['websocket']) // Use WebSocket transport
            .enableAutoConnect()
            .setQuery({'userId': userId}) // Attach user ID to the connection
            .build(),
      );

      // Listen for connection events
      _socket.onConnect((_) {
        _isConnected = true;
        logger.d('Connected to Socket.IO server');
        emit('userConnected', {'userId': userId});
      });

      // Listen for disconnection events
      _socket.onDisconnect((_) {
        _isConnected = false;
        logger.d('Disconnected from Socket.IO server');
      });
    } catch (e) {
      logger.e('Error connecting to Socket.IO server: $e');
    }
  }

  // Listen to specific events
  void on(String event, Function(dynamic) callback) {
    _socket.on(event, callback);
  }

  // Emit specific events
  void emit(String event, Map<String, dynamic> data) {
    if (_isConnected) {
      _socket.emit(event, data);
    } else {
      logger.e('Socket is not connected. Cannot emit event: $event');
    }
  }

  // Disconnect the socket
  void disconnect() {
    _socket.disconnect();
    _isConnected = false;
  }
}