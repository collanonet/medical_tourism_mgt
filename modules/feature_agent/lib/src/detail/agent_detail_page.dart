import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'agent_detail_model.dart';
import 'agent_detail_screen.dart';

@RoutePage()
class AgentDetailPage extends StatelessWidget {
  const AgentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<AgentDetailModel>(),
      child: const LayoutView(
        selectedIndex: 6,
        page: AgentDetailScreen(),
      ),
    );
  }
}
