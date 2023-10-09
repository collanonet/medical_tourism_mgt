import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'estimate_model.dart';
import 'estimate_screen.dart';

class EstimatePage extends StatelessWidget {
  const EstimatePage({
    super.key,
    this.patient,
  });
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
      GetIt.I<EstimateModel>()..initialData(patient: patient ),
      child: const EstimateScreen(),
    );
  }
}
