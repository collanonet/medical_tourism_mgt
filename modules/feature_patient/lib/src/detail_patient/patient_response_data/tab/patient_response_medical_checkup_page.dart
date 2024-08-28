// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_utils/core_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'patient_response_medical_checkup_form.dart';
import 'patient_response_medical_checkup_model.dart';
import 'patient_response_medical_checkup_screen.dart';

class PatientResponseMedicalCheckupPage extends StatelessWidget {
  const PatientResponseMedicalCheckupPage({super.key, this.patientId});
  final String? patientId;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
          form: () => medicalCheckupForm(),
          builder: (context, formGroup, child) {
            return Provider(
                create: (context) =>
                    GetIt.I<PatientResponseMedicalCheckupModel>()
                      ..getMedicalRecords(
                          formGroup: formGroup, patientId: patientId),
                child: const PatientResponseMedicalCheckupScreen());
          }),
    );
  }
}
