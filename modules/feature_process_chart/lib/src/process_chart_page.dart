import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_utils/routes.dart';
import 'package:flutter/material.dart';

import 'process_chart_screen.dart';

@RoutePage(name: Routes.processChartsRoute)
class ProcessChartPage extends StatefulWidget {
  const ProcessChartPage({super.key});

  @override
  State<ProcessChartPage> createState() => _ProcessChartPageState();
}

class _ProcessChartPageState extends State<ProcessChartPage> {
  @override
  Widget build(BuildContext context) {
    return const LayoutView(
      selectedIndex: 3,
      page: ProcessChartScreen(),
    );
  }
}
