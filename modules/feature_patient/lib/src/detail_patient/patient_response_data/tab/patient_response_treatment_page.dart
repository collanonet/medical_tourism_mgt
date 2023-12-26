import 'package:core_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'patient_response_treatment_form.dart';
import 'patient_response_treatment_model.dart';
import 'patient_response_treatment_screen.dart';

class PatientResponseTreatmentPage extends StatelessWidget {
  const PatientResponseTreatmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<PatientResponseTreatmentModel>(),
      child: ReactiveFormConfig(
        validationMessages: <String, ValidationMessageFunction>{
          ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
        },
        child: ReactiveFormBuilder(
            form: () => treatmentForm(),
            builder: (context, formGroup, child) {
              return const PatientResponseTreatmentScreen();
            }),
      ),
    );
  }
}
