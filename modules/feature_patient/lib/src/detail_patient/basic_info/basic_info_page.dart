import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:core_utils/core_utils.dart';

import 'basic_info_form.dart';
import 'basic_info_model.dart';
import 'basic_info_screen.dart';

class BasicInformationPage extends StatelessWidget {
  const BasicInformationPage({
    super.key,
    this.patient,
  });
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
        form: () => basicInfoForm(patientId: patient?.id)..markAllAsTouched(),
        builder: (context, formGroup, child) {
          return Provider(
            create: (context) => GetIt.I<BasicInformationModel>()
              ..initialData(patient: patient, formGroup: formGroup),
            child: const BasicInformationScreen(),
          );
        },
      ),
    );
  }
}
