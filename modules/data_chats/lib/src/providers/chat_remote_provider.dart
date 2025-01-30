import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_chat/socket_chat.dart';

@injectable
class ChatRemoteProvider {
  ChatRemoteProvider({
    required this.apiService,
    required this.socketService,
  });

  final ApiService apiService;
  final SocketService socketService;

  // API calls
  Future<Chat> createGroupChat(ChatGroupRequest chatGroupRequest) {
    return apiService.postChatGroup(chatGroupRequest);
  }

  Future<Chat> createPrivateChat(String user1Id) {
    return apiService.postChatPrivate(user1Id);
  }

  Future<List<Chat>> getChats() {
    return apiService.getChats();
  }

  Future<List<Message>> getMessagesByChatId(String chatId) {
    return apiService.getMessagesByChatId(chatId);
  }

  // Real-time interactions
  void sendMessage(String chatId, String senderId, String content) {
    socketService.emit('sendMessage', {
      'chatId': chatId,
      'senderId': senderId,
      'content': content,
    });
  }

  void startTyping(String chatId, String senderId) {
    socketService.emit('typing', {
      'chatId': chatId,
      'senderId': senderId,
    });
  }

  void stopTyping(String chatId, String senderId) {
    socketService.emit('stopTyping', {
      'chatId': chatId,
      'senderId': senderId,
    });
  }

  Future<void> deleteChat(String chatId) {
    return apiService.deleteChat(chatId);
  }
}