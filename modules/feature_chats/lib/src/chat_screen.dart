// Flutter imports:
import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';

// Package imports:
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
  final ValueNotifier<Patient?> _selectedPatient = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatModel>(builder: (context, model, _) {
      return Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
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
                          valueListenable: _selectedPatient,
                          builder: (context, value, _) {
                            return ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount:
                                    model.patientData.data?.items.length ?? 0,
                                itemBuilder: (context, index) {
                                  var item =
                                      model.patientData.data?.items[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: index % 2 != 0
                                          ? Colors.white
                                          : const Color(0xffEDF8F8),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: value == item
                                              ? Colors.blue
                                              : Colors.transparent,
                                          width: 1),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        _selectedPatient.value = item;
                                      },
                                      selected: value == item,
                                      selectedColor: Colors.blue,
                                      selectedTileColor: Colors.blue,
                                      tileColor: index % 2 == 0
                                          ? context.appTheme.primaryColor
                                          : Colors.white,
                                      title: Text(
                                        '${item?.firstNameRomanized ?? '-'} ${item?.middleNameRomanized ?? '-'} ${item?.familyNameRomanized ?? '-'}',
                                        style: TextStyle(
                                          color: context.appTheme.primaryColor,
                                          fontFamily: 'NotoSansJP',
                                          package: 'core_ui',
                                        ),
                                      ),
                                      subtitle: Text(
                                          '${item?.firstNameChineseOrVietnamese ?? '-'} ${item?.middleNameChineseOrVietnamese ?? '-'} ${item?.familyNameChineseOrVietnamese ?? '-'} / ${item?.firstNameJapaneseForChinese ?? '-'} ${item?.middleNameJapaneseForChinese ?? '-'} ${item?.familyNameJapaneseForChinese ?? '-'} / ${item?.firstNameJapaneseForNonChinese ?? '-'} ${item?.middleNameJapaneseForNonChinese ?? '-'} ${item?.familyNameJapaneseForNonChinese ?? '-'} '),
                                    ),
                                  );
                                });
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const VerticalDivider(),
          Expanded(
            flex: 2,
            child: ValueListenableBuilder(
                valueListenable: _selectedPatient,
                builder: (context, value, _) {
                  return MessageScreen(
                    patient: value,
                  );
                }),
          ),
        ],
      );
    });
  }
}
