// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_utils/routes.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'chat_model.dart';
import 'chat_screen.dart';

@RoutePage(name: Routes.chatRoute)
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatModel>().fetchChats();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const LayoutView(
      selectedIndex: 1,
      page: ChatScreen(),
    );
  }
}
