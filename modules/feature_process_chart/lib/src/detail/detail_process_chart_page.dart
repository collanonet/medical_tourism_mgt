import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'detail_process_chart_model.dart';
import 'detail_process_chart_screen.dart';

@RoutePage()
class DetailProcessChartPage extends StatelessWidget {
  const DetailProcessChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<DetailProcessChartModel>(),
      child: const LayoutView(
        selectedIndex: 4,
        page: DetailProcessChartScreen(),
      ),
    );
  }
}
