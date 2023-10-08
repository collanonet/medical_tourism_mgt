import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'medical_payment_details_model.dart';
import 'medical_payment_details_screen.dart';

class MedicalPaymentDetailsPage extends StatelessWidget {
  const MedicalPaymentDetailsPage({
    super.key,
    required this.patient,
  });
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
      GetIt.I<MedicalPaymentDetailModel>()..initialData(patient),
      child: const MedicalPaymentDetailScreen(),
    );
  }
}
