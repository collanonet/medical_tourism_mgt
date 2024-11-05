// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'medical_visa_form.dart';
import 'medical_visa_model.dart';
import 'medical_visa_screen.dart';

class MedicalVisaPage extends StatelessWidget {
  const MedicalVisaPage({
    super.key,
    this.patient,
    this.id,
  });
  final Patient? patient;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
        form: () => medicalVisaForm(medicalRecord: id!)..markAllAsTouched(),
        builder: (context, formGroup, child) {
          return Provider(
            create: (context) =>
                GetIt.I<MedicalVisaModel>()..fetchMedicalRecordVisa(formGroup,id: id!),
            child: const MedicalVisaScreen(),
          );
        },
      ),
    );
  }
}
