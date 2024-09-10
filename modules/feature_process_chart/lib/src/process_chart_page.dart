import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'process_chart_model.dart';
import 'process_chart_screen.dart';

@RoutePage(name: Routes.processChartsRoute)
class ProcessChartPage extends StatefulWidget {
  const ProcessChartPage({super.key, this.id});
  final String? id;

  @override
  State<ProcessChartPage> createState() => _ProcessChartPageState();
}

class _ProcessChartPageState extends State<ProcessChartPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<ProcessChartModel>()..fetchItinerary(),
      child: const LayoutView(
        selectedIndex: 4,
        page: ProcessChartScreen(),
      ),
    );
  }
}
