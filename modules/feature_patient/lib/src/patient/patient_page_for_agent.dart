import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_utils/routes.dart';
import 'package:feature_patient/src/patient/patient_screen_for_agent.dart';
import 'patient_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'patient_screen.dart';

class PatientPageFormAgent extends StatefulWidget {
  const PatientPageFormAgent({super.key, this.id});
  final String? id;
  @override
  State<PatientPageFormAgent> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPageFormAgent> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<PatientModel>()..patients(),
      child: Expanded(child: const PatientScreenForAgent()),
    );
  }
}
