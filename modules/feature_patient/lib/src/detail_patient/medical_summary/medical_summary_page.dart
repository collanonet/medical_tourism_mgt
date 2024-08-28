// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'medical_summary_model.dart';
import 'medical_summary_screen.dart';

class MedicalSummaryPage extends StatelessWidget {
  const MedicalSummaryPage({
    super.key,
    this.patient,
  });
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<MedicalSummaryModel>(),
      child: MedicalSummaryScreen(patientId: patient?.id),
    );
  }
}
