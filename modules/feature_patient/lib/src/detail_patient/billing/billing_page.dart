import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'billing_model.dart';
import 'billing_screen.dart';

class BillingPage extends StatelessWidget {
  const BillingPage({
    super.key,
    this.patient,
  });
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
      GetIt.I<BillingModel>()..initialData(patient: patient ),
      child: const BillingScreen(),
    );
  }
}
