import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_utils/routes.dart';
import 'package:flutter/material.dart';

import 'sale_screen.dart';

@RoutePage(name: Routes.salesRoute)
class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  @override
  Widget build(BuildContext context) {
    return const LayoutView(
      selectedIndex: 9,
      page: SaleScreen(),
    );
  }
}
