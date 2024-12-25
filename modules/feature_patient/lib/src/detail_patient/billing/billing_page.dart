// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'billing_model.dart';
import 'billing_screen.dart';

class BillingPage extends StatelessWidget {
  const BillingPage({
    super.key,
    required this.medicalRecord,
  });

  final MedicalRecord medicalRecord;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) =>
          GetIt.I<BillingModel>()..initialData(medicalRecord: medicalRecord),
      child: const BillingScreen(),
    );
  }
}
