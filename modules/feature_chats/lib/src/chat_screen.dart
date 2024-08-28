import 'package:core_ui/core_ui.dart';
import 'package:feature_chats/src/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'filter_chat.dart';
import 'message_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatModel>(builder: (context, model, _) {
      return Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const ChatFilter(),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: model.patientData.data?.items.length ?? 0,
                          itemBuilder: (context, index) {
                            var item = model.patientData.data?.items[index];
                            return Container(
                              decoration: BoxDecoration(
                                color: index % 2 != 0
                                    ? Colors.white
                                    : const Color(0xffEDF8F8),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: ListTile(
                                tileColor: index % 2 == 0
                                    ? context.appTheme.primaryColor
                                    : Colors.white,
                                leading: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.grey.shade300,
                                  ),
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '${item?.firstNameRomanized ?? '-'} ${item?.middleNameRomanized ?? '-'} ${item?.familyNameRomanized ?? '-'}',
                                      style: TextStyle(
                                        color: context.appTheme.primaryColor,
                                        fontFamily: 'NotoSansJP',
                                        package: 'core_ui',
                                      ),
                                    ),
                                    // Icon(
                                    //   Icons.star,
                                    //   color: Colors.orange,
                                    // ),
                                    // Spacer(),
                                    // Container(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       horizontal: 4, vertical: 2),
                                    //   decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(4),
                                    //     color: Colors.red,
                                    //   ),
                                    //   child: Text(
                                    //     '出国報告書対象者',
                                    //     style: TextStyle(color: Colors.white),
                                    //   ),
                                    // )
                                  ],
                                ),
                                subtitle: Text(
                                    '${item?.firstNameChineseOrVietnamese ?? '-'} ${item?.middleNameChineseOrVietnamese ?? '-'} ${item?.familyNameChineseOrVietnamese ?? '-'} / ${item?.firstNameJapaneseForChinese ?? '-'} ${item?.middleNameJapaneseForChinese ?? '-'} ${item?.familyNameJapaneseForChinese ?? '-'} / ${item?.firstNameJapaneseForNonChinese ?? '-'} ${item?.middleNameJapaneseForNonChinese ?? '-'} ${item?.familyNameJapaneseForNonChinese ?? '-'} '),
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
          const Expanded(child: MessageScreen()),
        ],
      );
    });
  }
}
