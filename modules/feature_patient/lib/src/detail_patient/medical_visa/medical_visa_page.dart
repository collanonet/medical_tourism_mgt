import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'medical_visa_model.dart';
import 'medical_visa_screen.dart';

class MedicalVisaPage extends StatelessWidget {
  const MedicalVisaPage({
    super.key,
    required this.patient,
  });
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
      GetIt.I<MedicalVisaModel>()..initialData(patient),
      child: const MedicalVisaScreen(),
    );
  }
}
