// Flutter imports:
import 'package:core_utils/async.dart';
import 'package:feature_chats/feature_chats.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:provider/provider.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({
    super.key,
  });

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _messageController = TextEditingController();

  final ValueNotifier<User?> _receiver = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return ValueListenableListener(
      valueListenable: context.read<ChatModel>().chat,
      onListen: () {
        var chat = context.read<ChatModel>().chat.value;

        if (chat.hasData) {
          _receiver.value = chat.requireData.users.firstWhere(
            (element) => element.id != context.read<ChatModel>().userId.value,
          );
          context.read<ChatModel>().fetchMessages(chat.requireData.id);
        }
      },
      child: ValueListenableBuilder(
          valueListenable: context.read<ChatModel>().chat,
          builder: (context, chat, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (chat.hasData) ...{
                  ValueListenableBuilder(
                    valueListenable: _receiver,
                    builder: (context, receiver, _) {
                      return Text(
                        '${receiver?.patient?.firstNameRomanized ?? '-'} ${receiver?.patient?.middleNameRomanized ?? '-'} ${receiver?.patient?.familyNameRomanized ?? '-'}',
                        style: context.textTheme.bodyLarge,
                      );
                    },
                  ),
                },
                const SizedBox(
                  height: 16,
                ),
                if (chat.hasData)
                  Expanded(
                      child: ValueListenableBuilder(
                          valueListenable: context.read<ChatModel>().messages,
                          builder: (context, messages, _) {
                            return ListView.builder(
                              itemCount: messages.data?.length ?? 0,
                              reverse: true,
                              itemBuilder: (context, index) {
                                var isMine = messages.data?[index].sender ==
                                    context.read<ChatModel>().userId.value;
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    mainAxisAlignment: !isMine
                                        ? MainAxisAlignment.start
                                        : MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: !isMine
                                              ? context.appTheme.primaryColor
                                              : Colors.grey.shade300,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Text(
                                          messages.data?[index].content ?? '',
                                          style: context.textTheme.bodyLarge!
                                              .copyWith(
                                                  color: !isMine
                                                      ? Colors.white
                                                      : Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          })),
                // input message
                if (chat.hasData)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _messageController,
                            decoration: const InputDecoration(
                              hintText: 'メッセージを入力してください',
                            ),
                            onEditingComplete: () {
                              context.read<ChatModel>().stopTyping();
                            },
                            onFieldSubmitted: (v) {
                              context.read<ChatModel>().stopTyping();
                            },
                            onTap: () {
                              context.read<ChatModel>().startTyping();
                            },
                            onTapOutside: (v) {
                              context.read<ChatModel>().stopTyping();
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<ChatModel>()
                                .sendMessage(_messageController.text);
                            _messageController.clear();
                          },
                          child: const Text('送信'),
                        ),
                      ],
                    ),
                  ),
              ],
            );
          }),
    );
  }
}
