import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:core_utils/core_utils.dart';
import 'application_risk_test_form.dart';
import 'application_risk_test_model.dart';
import 'application_risk_test_screen.dart';

class ApplicationRiskTestPage extends StatelessWidget {
  const ApplicationRiskTestPage({super.key, this.patientId});

  final String? patientId;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<ApplicationRiskTestModel>()
        ..getMedicalRecords(patientId: patientId),
      child: Builder(
        builder: (context) {
          return ValueListenableBuilder(
            valueListenable: context
                .watch<ApplicationRiskTestModel>()
                .applicationRiskTestResponse,
            builder: (context, value, _) {
              return Skeletonizer(
                enabled: value.loading,
                child: ReactiveFormConfig(
                  validationMessages: validationMessages,
                  child: ReactiveFormBuilder(
                    form: () => formRiskTest(data: value.data),
                    builder: (context, formGroup, child) {
                      return const ApplicationRiskTestScreen();
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
