import 'package:core_l10n/l10n.dart';
import 'package:core_network/core_network.dart';
import 'progress_list_form.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'progress_list_model.dart';
import 'progress_list_screen.dart';

class ProgressListPage extends StatelessWidget {
  const ProgressListPage({
    super.key,
    this.patient,
  });
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: <String, ValidationMessageFunction>{
        ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
      },
      child: ReactiveFormBuilder(
          form: () => progressListForm(),
          builder: (context, form, _) {
            return Provider(
              create: (context) => GetIt.I<ProgressListModel>()
                ..getMedicalRecords(form, patientId: patient?.id),
              child: const ProgressListScreen(),
            );
          }),
    );
  }
}
