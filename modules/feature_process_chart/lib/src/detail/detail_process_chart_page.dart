// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_view/base_view.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'detail_process_chart_model.dart';
import 'detail_process_chart_screen.dart';

@RoutePage()
class DetailProcessChartPage extends StatelessWidget {
  const DetailProcessChartPage({
    super.key,
    @PathParam('id') this.id,
  });
  final String? id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<DetailProcessChartModel>(),
      child: LayoutView(
        selectedIndex: 4,
        page: DetailProcessChartScreen(id: id),
      ),
    );
  }
}
