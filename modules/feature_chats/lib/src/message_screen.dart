import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LIU　WEIQIANG ',
          style: context.textTheme.titleLarge,
        ),
        SizedBox(
          height: 16,
        ),
        // generate list bubble message list with with message send and receive
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: index % 2 == 0
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        messages[index],
                        style: context.textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

List<String> messages = [
  'こんにちは。ご不明点ございましたらお気軽にメッセージしてください。',
  'ホテルを一緒に予約してもらうことはできますか？',
  'はい、可能です。候補ホテルを探しますのでお待ちください。',
  'ホテル情報をお出しします。',
  'ありがとうございます！',
];
