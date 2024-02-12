import 'package:core_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'normal_summary_form.dart';
import 'normal_summary_model.dart';
import 'short_summary_screen.dart';

class ShortSummaryPage extends StatelessWidget {
  const ShortSummaryPage({super.key, this.patientId});
  final String? patientId;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: <String, ValidationMessageFunction>{
        ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
      },
      child: ReactiveFormBuilder(
          form: () => normalSummaryForm(),
          builder: (context, formGroup, child) {
            return Provider(
                create: (context) => GetIt.I<NormalSummaryModel>()
                  ..getMedicalRecords(
                      formGroup: formGroup, patientId: patientId),
                child: const ShortSummaryScreen());
          }),
    );
  }
}
