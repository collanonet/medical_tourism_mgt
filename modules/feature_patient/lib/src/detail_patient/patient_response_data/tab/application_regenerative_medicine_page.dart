import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'application_regenerative_medicine_form.dart';
import 'application_regenerative_medicine_model.dart';
import 'application_regenerative_medicine_screen.dart';

class ApplicationRegenerativeMedicalPage extends StatelessWidget {
  const ApplicationRegenerativeMedicalPage({super.key, this.patientId});

  final String? patientId;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<ApplicationRegenerativeMedicalModel>()
        ..getMedicalRecords(patientId: patientId),
      child: Builder(
        builder: (context) {
          return ValueListenableBuilder(
            valueListenable: context
                .watch<ApplicationRegenerativeMedicalModel>()
                .applicationRegenerativeMedical,
            builder: (context, value, _) {
              return Skeletonizer(
                enabled: value.loading,
                child: ReactiveFormConfig(
                  validationMessages: {
                    ValidationMessage.required: (error) => 'この項目は必須です',
                  },
                  child: ReactiveFormBuilder(
                    form: () =>
                        formApplicationRegenerativeMedical(data: value.data),
                    builder: (context, formGroup, child) {
                      return const ApplicationRegenerativeMedicalScreen();
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
