// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'patient_model.dart';
import 'patient_screen_for_agent.dart';

class PatientPageFormAgent extends StatefulWidget {
  const PatientPageFormAgent({super.key, this.id});
  final String? id;
  @override
  State<PatientPageFormAgent> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPageFormAgent> {
  ScrollController? scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<PatientModel>()..patients(),
      child: const SingleChildScrollView(child: PatientScreenForAgent()),
    );
  }
}
