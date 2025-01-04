// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'billing_form.dart';
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
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
        form: () => billingForm(),
        builder: (context, formGroup, child) {
          return Provider(
            create: (context) => GetIt.I<BillingModel>()
              ..initialData(medicalRecord: medicalRecord, formGroup: formGroup),
            child: const BillingScreen(),
          );
        },
      ),
    );
  }
}
