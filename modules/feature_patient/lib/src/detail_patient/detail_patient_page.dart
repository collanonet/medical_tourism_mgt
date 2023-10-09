import 'package:auto_route/auto_route.dart';
import 'package:base_view/base_view.dart';
import 'package:core_network/entities.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'detail_patient_model.dart';
import 'detail_patient_screen.dart';

@RoutePage()
class DetailPatientPage extends StatelessWidget {
  const DetailPatientPage({
    super.key,
    @PathParam('id') this.id,
    this.patient,
  });
  final String? id;
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          GetIt.I<DetailPatientModel>()..initialData(patient: patient, id: id),
      child: LayoutView(
        selectedIndex: 0,
        page: Consumer<DetailPatientModel>(
          builder: (context, model, _) {
            return Skeletonizer(
              enabled: model.patient.loading,
              child: DetailPatientScreen(patient: model.patient.data),
            );
          },
        ),
      ),
    );
  }
}
