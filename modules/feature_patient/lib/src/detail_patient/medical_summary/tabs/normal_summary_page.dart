import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'normal_summary_form.dart';
import 'package:core_utils/core_utils.dart';
import 'normal_summary_model.dart';
import 'normal_summary_screen.dart';

class NormalSummaryPage extends StatelessWidget {
  const NormalSummaryPage({super.key, this.patientId});
  final String? patientId;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
          form: () => normalSummaryForm(),
          builder: (context, formGroup, child) {
            return Provider(
                create: (context) => GetIt.I<NormalSummaryModel>()
                  ..getMedicalRecords(
                      formGroup: formGroup, patientId: patientId),
                child: const NormalSummaryScreen());
          }),
    );
  }
}
