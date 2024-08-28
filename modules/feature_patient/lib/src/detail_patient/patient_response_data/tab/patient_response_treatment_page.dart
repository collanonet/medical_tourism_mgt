// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_utils/core_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'patient_response_treatment_form.dart';
import 'patient_response_treatment_model.dart';
import 'patient_response_treatment_screen.dart';

class PatientResponseTreatmentPage extends StatelessWidget {
  const PatientResponseTreatmentPage({super.key, this.patientId});
  final String? patientId;

  @override
  Widget build(BuildContext context) {
    logger.d('patientId build: $patientId');
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
          form: () => treatmentForm(),
          builder: (context, formGroup, child) {
            return Provider(
                create: (context) => GetIt.I<PatientResponseTreatmentModel>()
                  ..init(patientId, formGroup),
                child: const PatientResponseTreatmentScreen());
          }),
    );
  }
}
