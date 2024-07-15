import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:flutter/material.dart';

import 'contract_screen.dart';

@RoutePage()
class ContractPage extends StatelessWidget {
  const ContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutView(
      selectedIndex: 9,
      page: const ContractScreen(),
    );
  }
}
