import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_network/entities.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'detail_patient_model.dart';
import 'detail_patient_screen.dart';

@RoutePage()
class DetailPatientPage extends StatelessWidget {
  const DetailPatientPage({
    super.key,
    required this.patient,
  });
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<DetailPatientModel>()..initialData(patient),
      child: LayoutView(
        selectedIndex: 0,
        page: DetailPatientScreen(patient: patient),
      ),
    );
  }
}
