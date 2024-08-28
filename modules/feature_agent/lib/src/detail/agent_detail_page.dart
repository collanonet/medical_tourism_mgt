// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'agent_detail_model.dart';
import 'agent_detail_screen.dart';

@RoutePage()
class AgentDetailPage extends StatelessWidget {
  const AgentDetailPage({
    super.key,
    @PathParam('id') this.id,
  });
  final String? id;
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<AgentDetailModel>(),
      child: LayoutView(
        selectedIndex: 6,
        page: AgentDetailScreen(id: id),
      ),
    );
  }
}
