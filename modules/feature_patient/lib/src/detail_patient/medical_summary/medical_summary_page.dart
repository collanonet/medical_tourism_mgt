import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (context) =>
      GetIt.I<MedicalSummaryModel>()..initialData(patient: patient ),
      child: const MedicalSummaryScreen(),
    );
  }
}
