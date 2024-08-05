import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_utils/routes.dart';
import 'package:flutter/material.dart';

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
