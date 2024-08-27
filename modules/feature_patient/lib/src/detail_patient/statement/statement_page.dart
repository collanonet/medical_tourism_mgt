import 'package:core_l10n/l10n.dart';
import 'package:core_network/core_network.dart';
import 'statement_form.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:core_utils/core_utils.dart';
import 'statement_model.dart';
import 'statement_screen.dart';

class StatementPage extends StatelessWidget {
  const StatementPage({
    super.key,
    this.patient,
  });
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          GetIt.I<StatementModel>()..initialData(patient: patient),
      child: ReactiveFormConfig(
        validationMessages: validationMessages,
        child: ReactiveFormBuilder(
            form: () => statementForm(),
            builder: (context, formGroup, child) {
              return const StatementScreen();
            }),
      ),
    );
  }
}
