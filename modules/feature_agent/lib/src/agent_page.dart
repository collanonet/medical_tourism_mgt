import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:flutter/material.dart';

import 'agent_screen.dart';

@RoutePage()
class AgentPage extends StatelessWidget {
  const AgentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SideBarMenu(
      page: AgentScreen(),
    );
  }
}
