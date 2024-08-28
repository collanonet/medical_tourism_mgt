// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'patient_response_model.dart';
import 'patient_response_screen.dart';

class PatientResponsePage extends StatelessWidget {
  const PatientResponsePage({
    super.key,
    this.patient,
  });
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<PatientResponseModel>(),
      child: PatientResponseScreen(
        patientId: patient?.id,
      ),
    );
  }
}
