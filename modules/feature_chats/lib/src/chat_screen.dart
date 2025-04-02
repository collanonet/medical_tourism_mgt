// Flutter imports:
import 'package:auto_route/auto_route.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:feature_chats/src/chat_model.dart';
import 'filter_chat.dart';
import 'message_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder3(
        first: context.read<ChatModel>().chats,
        second: context.read<ChatModel>().userId,
        third: context.read<ChatModel>().tempChats,
        builder: (context, chats, userId, tempChats, _) {
          return Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ChatFilter(),
                      const SizedBox(height: 16),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: ValueListenableBuilder(
                              valueListenable: context.read<ChatModel>().chat,
                              builder: (context, selectedChats, _) {
                                return listChat(
                                  tempChats.data ?? chats.data ?? [],
                                  userId,
                                  selectedChats.data,
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalDivider(),
              const Expanded(
                flex: 2,
                child: MessageScreen(),
              ),
            ],
          );
        });
  }

  Widget listChat(List<Chat> chats, String? userId, Chat? selectedChats) {
    return ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          var item = chats[index];
          User? fromUser =
              item.users.firstWhere((element) => element.id != userId);
          return Container(
            decoration: BoxDecoration(
              color: index % 2 != 0 ? Colors.white : const Color(0xffEDF8F8),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                  color:
                      selectedChats == item ? Colors.blue : Colors.transparent,
                  width: 1),
            ),
            child: ListTile(
              onTap: () {
                context.read<ChatModel>().selectChat(chat: item);
              },
              selected: selectedChats == item,
              selectedColor: Colors.blue,
              selectedTileColor: Colors.blue,
              tileColor:
                  index % 2 == 0 ? context.appTheme.primaryColor : Colors.white,
              title: Text(
                '${fromUser?.patient?.firstNameRomanized ?? '-'} ${fromUser?.patient?.middleNameRomanized ?? '-'} ${fromUser?.patient?.familyNameRomanized ?? '-'}',
                style: TextStyle(
                  color: context.appTheme.primaryColor,
                  fontFamily: 'NotoSansJP',
                  package: 'core_ui',
                ),
              ),
              subtitle: Text(
                item.latestMessage?.content ?? '-',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(
                item.latestMessage?.timestamp != null
                    ? Strings.shortDateTimeName(item.latestMessage!.timestamp)
                    : '-',
                style: context.textTheme.bodySmall,
              ),
            ),
          );
        });
  }
}
