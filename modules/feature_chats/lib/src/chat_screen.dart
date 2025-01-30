// Flutter imports:
import 'package:core_utils/async.dart';
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
        first: context.read<ChatModel>().patientData,
        second: context.read<ChatModel>().chats,
        third: context.read<ChatModel>().userId,
        builder: (context, patientData, chats, userId, _) {
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
                          child: ValueListenableBuilder2(
                              first: context.read<ChatModel>().patient,
                              second: context.read<ChatModel>().chat,
                              builder:
                                  (context, selectedPatient, selectedChats, _) {
                                return SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: chats.data?.length ?? 0,
                                          itemBuilder: (context, index) {
                                            var item = chats.data?[index];
                                            User? fromUser = item?.users
                                                .firstWhere((element) =>
                                                    element.id != userId);
                                            return Container(
                                              decoration: BoxDecoration(
                                                color: index % 2 != 0
                                                    ? Colors.white
                                                    : const Color(0xffEDF8F8),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                    color: selectedChats.data ==
                                                            item
                                                        ? Colors.blue
                                                        : Colors.transparent,
                                                    width: 1),
                                              ),
                                              child: ListTile(
                                                onTap: () {
                                                  context
                                                      .read<ChatModel>()
                                                      .selectChat(chat: item);
                                                },
                                                selected:
                                                    selectedChats.data == item,
                                                selectedColor: Colors.blue,
                                                selectedTileColor: Colors.blue,
                                                tileColor: index % 2 == 0
                                                    ? context
                                                        .appTheme.primaryColor
                                                    : Colors.white,
                                                title: Text(
                                                  fromUser?.fullName ?? '-',
                                                  style: TextStyle(
                                                    color: context
                                                        .appTheme.primaryColor,
                                                    fontFamily: 'NotoSansJP',
                                                    package: 'core_ui',
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  item?.latestMessage
                                                          ?.content ??
                                                      '-',
                                                ),
                                              ),
                                            );
                                          }),
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount:
                                              patientData.data?.items.length ??
                                                  0,
                                          itemBuilder: (context, index) {
                                            var item =
                                                patientData.data?.items[index];
                                            return Container(
                                              decoration: BoxDecoration(
                                                color: index % 2 != 0
                                                    ? Colors.white
                                                    : const Color(0xffEDF8F8),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                    color: selectedPatient
                                                                .data ==
                                                            item
                                                        ? Colors.blue
                                                        : Colors.transparent,
                                                    width: 1),
                                              ),
                                              child: ListTile(
                                                onTap: () {
                                                  context
                                                      .read<ChatModel>()
                                                      .selectChat();
                                                  context
                                                      .read<ChatModel>()
                                                      .selectPatient(
                                                          patient: item);
                                                },
                                                selected:
                                                    selectedPatient.data ==
                                                        item,
                                                selectedColor: Colors.blue,
                                                selectedTileColor: Colors.blue,
                                                tileColor: index % 2 == 0
                                                    ? context
                                                        .appTheme.primaryColor
                                                    : Colors.white,
                                                title: Text(
                                                  '${item?.firstNameRomanized ?? '-'} ${item?.middleNameRomanized ?? '-'} ${item?.familyNameRomanized ?? '-'}',
                                                  style: TextStyle(
                                                    color: context
                                                        .appTheme.primaryColor,
                                                    fontFamily: 'NotoSansJP',
                                                    package: 'core_ui',
                                                  ),
                                                ),
                                                subtitle: Text(
                                                    '${item?.firstNameChineseOrVietnamese ?? '-'} ${item?.middleNameChineseOrVietnamese ?? '-'} ${item?.familyNameChineseOrVietnamese ?? '-'} / ${item?.firstNameJapaneseForChinese ?? '-'} ${item?.middleNameJapaneseForChinese ?? '-'} ${item?.familyNameJapaneseForChinese ?? '-'} / ${item?.firstNameJapaneseForNonChinese ?? '-'} ${item?.middleNameJapaneseForNonChinese ?? '-'} ${item?.familyNameJapaneseForNonChinese ?? '-'} '),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
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
}
