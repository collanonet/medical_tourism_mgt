// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_utils/routes.dart';

// Project imports:
import 'master_screen.dart';

@RoutePage(name: Routes.masterRoute)
class MasterPage extends StatelessWidget {
  const MasterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutView(
      selectedIndex: 9,
      page: MasterScreen(),
    );
  }
}
