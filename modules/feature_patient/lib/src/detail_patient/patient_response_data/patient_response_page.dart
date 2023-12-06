import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<PatientResponseModel>(),
      child: const PatientResponseScreen(),
    );
  }
}
