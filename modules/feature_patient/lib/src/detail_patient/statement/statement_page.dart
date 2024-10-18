// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'statement_form.dart';
import 'statement_model.dart';
import 'statement_screen.dart';

class StatementPage extends StatelessWidget {
  const StatementPage({
    super.key,
    required this.patient,
    required this.medicalRecord,
  });

  final Patient patient;
  final MedicalRecord medicalRecord;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
        form: () => statementForm(),
        builder: (context, formGroup, child) {
          return Provider(
            create: (context) => GetIt.I<StatementModel>()
              ..initialData(
                patient: patient,
                medicalRecord: medicalRecord,
                formGroup: formGroup,
              ),
            child: const StatementScreen(),
          );
        },
      ),
    );
  }
}
