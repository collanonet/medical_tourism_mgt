import 'package:core_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'patient_response_medical_checkup_form.dart';
import 'patient_response_medical_checkup_model.dart';

import 'patient_response_medical_checkup_screen.dart';
import 'package:provider/provider.dart';

class PatientResponseMedicalCheckupPage extends StatelessWidget {
  const PatientResponseMedicalCheckupPage({super.key, this.patientId});
  final String? patientId;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<PatientResponseMedicalCheckupModel>(),
      child: ReactiveFormConfig(
        validationMessages: <String, ValidationMessageFunction>{
          ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
        },
        child: ReactiveFormBuilder(
            form: () => medicalCheckupForm(),
            builder: (context, formGroup, child) {
              return const PatientResponseMedicalCheckupScreen();
            }),
      ),
    );
  }
}
