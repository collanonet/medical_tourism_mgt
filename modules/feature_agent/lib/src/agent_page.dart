// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_utils/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'agent_model.dart';
import 'agent_screen.dart';

@RoutePage(name: Routes.agentsRoute)
class AgentPage extends StatelessWidget {
  const AgentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<AgentModel>()..getAgents(),
      child: const LayoutView(
        selectedIndex: 6,
        page: AgentScreen(),
      ),
    );
  }
}
