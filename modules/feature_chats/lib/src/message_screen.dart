// Flutter imports:
import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({
    super.key,
    this.patient,
  });

  final Patient? patient;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  void didUpdateWidget(covariant MessageScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.patient != oldWidget.patient) {
      setState(() {});
    }
  }

  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return widget.patient == null
        ? const Center(
            child: Text('患者を選択してチャットを開始する'),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.patient?.firstNameRomanized ?? '-'} ${widget.patient?.middleNameRomanized ?? '-'} ${widget.patient?.familyNameRomanized ?? '-'}',
                style: context.textTheme.titleLarge,
              ),
              const SizedBox(
                height: 16,
              ),
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
                              style: context.textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // input message
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: 'メッセージを入力してください',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('送信'),
                    ),
                  ],
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
  'こんにちは。ご不明点ございましたらお気軽にメッセージしてください。',
  'ホテルを一緒に予約してもらうことはできますか？',
  'はい、可能です。候補ホテルを探しますのでお待ちください。',
  'ホテル情報をお出しします。',
  'ありがとうございます！',
  'こんにちは。ご不明点ございましたらお気軽にメッセージしてください。',
  'ホテルを一緒に予約してもらうことはできますか？',
  'はい、可能です。候補ホテルを探しますのでお待ちください。',
  'ホテル情報をお出しします。',
  'ありがとうございます！',
];
