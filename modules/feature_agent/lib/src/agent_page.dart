import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_utils/routes.dart';
import 'package:flutter/material.dart';

import 'agent_screen.dart';

@RoutePage(name: Routes.agentsRoute)
class AgentPage extends StatelessWidget {
  const AgentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SideBarMenu(
      selectedIndex: 5,
      page: AgentScreen(),
    );
  }
}
