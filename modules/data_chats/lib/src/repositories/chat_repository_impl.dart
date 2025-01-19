// Package imports:
import 'package:core_network/src/entities/chat.dart';
import 'package:core_network/src/entities/chat_group_request.dart';
import 'package:core_network/src/entities/message.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../providers/chat_local_provider.dart';
import '../providers/chat_remote_provider.dart';
import 'chat_repository.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryIml extends ChatRepository {
  ChatRepositoryIml({
    required this.remote,
    required this.local,
  });

  final ChatRemoteProvider remote;
  final ChatLocalProvider local;

  @override
  Future<Chat> createGroupChat(ChatGroupRequest chatGroupRequest) {
    return remote.createGroupChat(chatGroupRequest);
  }

  @override
  Future<Chat> createPrivateChat(String user1Id) {
    return remote.createPrivateChat(user1Id);
  }

  @override
  Future<List<Chat>> fetchChats() {
    return remote.getChats();
  }

  @override
  Future<List<Message>> fetchMessages(String chatId) {
    return remote.getMessagesByChatId(chatId);
  }

  @override
  void sendMessage(String chatId, String senderId, String content) {
    remote.sendMessage(chatId, senderId, content);
  }

  @override
  void startTyping(String chatId, String senderId) {
    remote.startTyping(chatId, senderId);
  }

  @override
  void stopTyping(String chatId, String senderId) {
    remote.stopTyping(chatId, senderId);
  }

  @override
  Future<void> deleteChat(String chatId) {
    return remote.deleteChat(chatId);
  }
}
