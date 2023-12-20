import 'package:flutter/material.dart';

import 'filter_chat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatFilter(),
        const Center(
          child: Text('Chat Screen'),
        ),
      ],
    );
  }
}
