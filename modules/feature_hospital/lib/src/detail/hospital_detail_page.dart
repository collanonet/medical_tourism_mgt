import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:flutter/material.dart';

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
    return LayoutView(
      selectedIndex: 5,
      page: HospitalDetailScreen(hospitalId: id),
    );
  }
}
