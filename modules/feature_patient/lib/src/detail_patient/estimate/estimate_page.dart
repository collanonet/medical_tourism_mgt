// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'estimate_form.dart';
import 'estimate_model.dart';
import 'estimate_screen.dart';

class EstimatePage extends StatelessWidget {
  const EstimatePage({
    super.key,
    required this.patient,
    required this.medicalRecord,
  });

  final Patient patient;
  final MedicalRecord medicalRecord;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
        form: () => estimateForm(),
        builder: (context, formGroup, child) {
          return Provider(
            create: (context) => GetIt.I<EstimateModel>()
              ..initialData(
                patient: patient,
                medicalRecord: medicalRecord,
                formGroup: formGroup,
              ),
            child: const EstimateScreen(),
          );
        },
      ),
    );
  }
}
