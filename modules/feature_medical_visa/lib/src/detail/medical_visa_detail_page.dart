// Flutter imports:
import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'medical_visa_detail_model.dart';
import 'medical_visa_detail_screen.dart';

@RoutePage()
class MedicalVisaDetailPage extends StatelessWidget {
  const MedicalVisaDetailPage({
    super.key,
    @PathParam('id') this.id,
    this.patient,
  });

  final String? id;
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<MedicalVisaDetailModel>()
        ..initMedicalRecord(patient, patient?.id ?? id),
      child: const LayoutView(
        selectedIndex: 2,
        page: MedicalVisaDetailScreen(),
      ),
    );
  }
}
