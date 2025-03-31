// Flutter imports:
import 'package:data_chats/data_chats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/src/models/models.dart';
import 'package:socket_chat/socket_chat.dart';

@injectable
class ChatModel {
  ChatModel({
    required this.chatRepository,
    required this.socketService,
    required this.patientRepository,
  });

  final SocketService socketService;
  final ChatRepository chatRepository;
  final PatientRepository patientRepository;

  // ValueNotifier to hold and update the list of messages
  ValueNotifier<AsyncData<List<Message>>> messages =
      ValueNotifier(const AsyncData());

  // ValueNotifier for the list of chats
  ValueNotifier<AsyncData<List<Chat>>> chats = ValueNotifier(const AsyncData());

  // ValueNotifier for the list of chats
  ValueNotifier<AsyncData<List<Chat>>> tempChats =
      ValueNotifier(const AsyncData());

  // ValueNotifier for the currently selected chat
  ValueNotifier<AsyncData<Chat>> chat = ValueNotifier(const AsyncData());

  // ValueNotifier for the user ID
  ValueNotifier<String?> userId = ValueNotifier(null);

  // ValueNotifier to track users currently typing
  ValueNotifier<List<String>> typingUsers = ValueNotifier([]);

  // Initialize the socket connection and listen for real-time events
  void initialize(String userId) {
    this.userId.value = userId;
    socketService.connect(userId: userId);

    // Register the user as connected
    socketService.emit('userConnected', {'userId': userId});

    // Listen for real-time message updates
    socketService.on('message', (data) {
      try {
        final newMessage =
            Message.fromJson(data['message']); // Parse the incoming message

        if (newMessage.sender != userId &&
            chat.value.data?.id == newMessage.chatId) {
          // Add the new message to the list
          _addMessage(newMessage);
          // Emit event to notify the server that the message was received
          socketService.emit('messageReceived', {
            'chatId': newMessage.chatId,
            'messageId': newMessage.id,
          });
        }
      } catch (e) {
        logger.e('Error parsing real-time message: $e');
      }
    });

    // Listen for typing indicator events
    socketService.on('typing', (data) {
      final typingUserId = data['senderId'] as String;
      logger.d('User is typing: $typingUserId');
      if (!typingUsers.value.contains(typingUserId)) {
        typingUsers.value = [...typingUsers.value, typingUserId];
      }
    });

    // Listen for stopTyping events
    socketService.on('stopTyping', (data) {
      final typingUserId = data['senderId'] as String;
      logger.d('User stopped typing: $typingUserId');
      typingUsers.value =
          typingUsers.value.where((id) => id != typingUserId).toList();
    });
  }

  // Fetch the list of chats
  Future<void> fetchChats() async {
    chats.value = const AsyncData(loading: true);
    try {
      final fetchedChats = await chatRepository.fetchChats();
      chats.value = AsyncData(data: fetchedChats);
      patients();
    } catch (error) {
      logger.e('Error fetching chats: $error');
      chats.value = AsyncData(error: error);
    }
  }

  // Fetch messages from the repository (initial fetch)
  Future<void> fetchMessages(String chatId) async {
    messages.value = const AsyncData(loading: true);
    try {
      final fetchedMessages = await chatRepository.fetchMessages(chatId);
      messages.value = AsyncData(data: fetchedMessages.reversed.toList());
    } catch (error) {
      logger.e('Error fetching messages: $error');
      messages.value = AsyncData(error: error);
    }
  }

// Add a new message to the list and notify listeners, avoiding duplicates
  void _addMessage(Message message) {
    final currentMessages = messages.value.data ?? [];
    if (!currentMessages
        .any((msg) => msg.id == message.tempId || msg.id == message.id)) {
      messages.value = AsyncData(data: [message, ...currentMessages]);
    }
  }

// Send a new message
  void sendMessage(String content) {
    logger.d('Sending message: $content');
    try {
      final currentChatId = chat.value.requireData.id;
      if (userId.value == null) {
        logger.e('Chat ID or User ID is null');
        return;
      }

      if (!socketService.isConnected) {
        logger.e('Socket is not connected');
        return;
      }

      var tempId = UniqueKey().toString();
      final newMessage = Message(
        id: tempId,
        chatId: currentChatId,
        sender: userId.value!,
        content: content,
        timestamp: DateTime.now(),
      );

      socketService.emit('sendMessage', {
        'chatId': currentChatId,
        'senderId': userId.value!,
        'content': content,
        'tempId': tempId,
      });

      // Optimistically add the message to the list, avoiding duplicates
      _addMessage(newMessage);
    } catch (e) {
      logger.e('Error sending message: $e');
    }
  }

  // Emit typing event
  void startTyping() {
    final currentChatId = chat.value.data?.id;
    if (currentChatId != null && userId.value != null) {
      socketService.emit('typing', {
        'chatId': currentChatId,
        'senderId': userId.value!,
      });
    }
  }

  // Emit stopTyping event
  void stopTyping() {
    final currentChatId = chat.value.data?.id;
    if (currentChatId != null && userId.value != null) {
      socketService.emit('stopTyping', {
        'chatId': currentChatId,
        'senderId': userId.value!,
      });
    }
  }

  void joinChat(String chatId) {
    if (!socketService.isConnected) {
      logger.e('Socket is not connected');
      return;
    }

    final currentUserId = userId.value;
    if (chatId.isNotEmpty && currentUserId != null) {
      socketService
          .emit('joinChat', {'chatId': chatId, 'userId': currentUserId});
      logger.d('User joined chat: $chatId');
    } else {
      logger.e('Chat ID or User ID is null');
    }
  }

  // Fetch patients (existing functionality)

  Future<void> patients() async {
    try {
      final value = await patientRepository.newChatPatients(
        limit: 100,
      );
      final existingUserIds = <String>{};

      for (var item in chats.value.requireData) {
        for (var user in item.users) {
          existingUserIds.add(user.id);
        }
      }

      for (var patient in value.items) {
        if (!existingUserIds.contains(patient.user)) {
          await createChat(patient.user);
        }
      }
    } catch (error) {
      logger.d(error);
    }
  }

  // Select a chat
  void selectChat({Chat? chat}) {
    try {
      this.chat.value = AsyncData(data: chat);

      if (chat?.id != null) {
        joinChat(chat!.id); // Join the selected chat
      }
    } catch (e) {
      logger.e(e);
    }
  }

  // Create a new chat
  Future<void> createChat(String user1Id) async {
    try {
      var result = await chatRepository.createPrivateChat(user1Id);
      chat.value = AsyncData(data: result);
      chats.value = AsyncData(
        data: [
          result,
          ...?chats.value.data,
        ],
      );
      //
      // // Emit event to notify the server about the new chat
      // socketService.emit('newChat', {
      //   'userIds': result.users.map((user) => user.id).toList(),
      //   'creatorId': userId.value!,
      // });
    } catch (e) {
      logger.e(e);
    }
  }

  void deleteChat() {
    try {
      chatRepository.deleteChat(chat.value.requireData.id);
      fetchChats();
    } catch (e) {
      logger.e(e);
    }
  }

  void filterChat(String? value) {
    if (value == null || value.isEmpty) {
      chats.value = AsyncData(
        data: chats.value.data,
      );
      tempChats.value = AsyncData();
    } else {
      tempChats.value = AsyncData(
        data: chats.value.requireData
            .where((element) =>
                '${element.users.firstWhere((element) => element.patient != null).patient?.firstNameRomanized} ${element.users.firstWhere((element) => element.patient != null).patient?.middleNameRomanized} ${element.users.firstWhere((element) => element.patient != null).patient?.familyNameRomanized}'
                    .contains(value))
            .toList(),
      );
    }
  }
}
