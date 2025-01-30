import 'package:core_network/core_network.dart';

abstract class ChatRepository {
  // Fetch list of chats
  Future<List<Chat>> fetchChats();

  // Create a private chat
  Future<Chat> createPrivateChat(String user1Id);

  // Create a group chat
  Future<Chat> createGroupChat(ChatGroupRequest chatGroupRequest);

  // Fetch messages by chat ID
  Future<List<Message>> fetchMessages(String chatId);

  // Send a message using Socket.IO
  void sendMessage(String chatId, String senderId, String content);

  // Emit typing event
  void startTyping(String chatId, String senderId);

  // Emit stop typing event
  void stopTyping(String chatId, String senderId);

  Future<void> deleteChat(String chatId);
}
