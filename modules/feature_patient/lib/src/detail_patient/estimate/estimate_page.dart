import 'package:core_l10n/l10n.dart';
import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:core_utils/core_utils.dart';

import 'estimate_form.dart';
import 'estimate_model.dart';
import 'estimate_screen.dart';

class EstimatePage extends StatelessWidget {
  const EstimatePage({
    super.key,
    this.patient,
  });
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          GetIt.I<EstimateModel>()..initialData(patient: patient),
      child: ReactiveFormConfig(
        validationMessages: validationMessages,
        child: ReactiveFormBuilder(
            form: () => estimateForm(),
            builder: (context, formGroup, child) {
              return const EstimateScreen();
            }),
      ),
    );
  }
}
