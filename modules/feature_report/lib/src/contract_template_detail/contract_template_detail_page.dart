import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:flutter/material.dart';

import 'contract_template_detail_screen.dart';

@RoutePage()
class ContractDetailPage extends StatelessWidget {
  const ContractDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutView(
      selectedIndex: 9,
      page: ContractDetailScreen(),
    );
  }
}
