// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'hospital_detail_model.dart';
import 'hospital_detail_screen.dart';

@RoutePage()
class HospitalDetailPage extends StatelessWidget {
  const HospitalDetailPage({
    super.key,
    @PathParam('id') this.id,
  });
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => GetIt.I<HospitalDetailModel>(),
      child: LayoutView(
        selectedIndex: 5,
        page: HospitalDetailScreen(hospitalId: id),
      ),
    );
  }
}
