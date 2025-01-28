// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_utils/core_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import 'application_blood_purification_therapy_form.dart';
import 'application_blood_purification_therapy_model.dart';
import 'application_blood_purification_therapy_screen.dart';

class ApplicationBloodPurificationTherapyPage extends StatelessWidget {
  const ApplicationBloodPurificationTherapyPage({super.key, this.patientId});

  final String? patientId;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<ApplicationBloodPurificationTherapyModel>()
        ..getMedicalRecords(patientId: patientId),
      child: Builder(
        builder: (context) {
          return ValueListenableBuilder(
            valueListenable: context
                .watch<ApplicationBloodPurificationTherapyModel>()
                .applicationBloodPurificationTherapyResponse,
            builder: (context, value, _) {
              return Skeletonizer(
                enabled: value.loading,
                child: ReactiveFormConfig(
                  validationMessages: validationMessages,
                  child: ReactiveFormBuilder(
                    form: () => formPurificationTherapy(data: value.data)..markAllAsTouched(),
                    builder: (context, formGroup, child) {
                      return const ApplicationBloodPurificationTherapyScreen();
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
