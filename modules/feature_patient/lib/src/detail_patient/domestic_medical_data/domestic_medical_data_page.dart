import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'domestic_medical_data_model.dart';
import 'domestic_medical_data_screen.dart';

class DomesticMedicalDataPage extends StatelessWidget {
  const DomesticMedicalDataPage({
    super.key,
    required this.patient,
  });
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
      GetIt.I<DomesticMedicalDataModel>()..initialData(patient),
      child: const BDomesticMedicalDataScreen(),
    );
  }
}
