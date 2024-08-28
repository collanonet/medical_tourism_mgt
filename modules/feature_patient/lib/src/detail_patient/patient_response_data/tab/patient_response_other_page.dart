import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:core_utils/core_utils.dart';
import 'patient_response_other_form.dart';
import 'patient_response_other_model.dart';
import 'patient_response_other_screen.dart';

class PatientResponseOtherPage extends StatelessWidget {
  const PatientResponseOtherPage({super.key, this.patientId});
  final String? patientId;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
          form: () => otherForm(),
          builder: (context, formGroup, child) {
            return Provider(
                create: (context) => GetIt.I<PatientResponseOtherModel>()
                  ..getMedicalRecords(
                      patientId: patientId, formGroup: formGroup),
                child: const PatientResponseOtherScreen());
          }),
    );
  }
}
