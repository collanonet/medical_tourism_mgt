// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'progress_list_form.dart';
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
      validationMessages: validationMessages,
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
