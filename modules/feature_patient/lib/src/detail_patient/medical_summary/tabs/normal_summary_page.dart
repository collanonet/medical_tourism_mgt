import 'package:core_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'normal_summary_form.dart';
import 'normal_summary_model.dart';
import 'normal_summary_screen.dart';

class NormalSummaryPage extends StatelessWidget {
  const NormalSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<NormalSummaryModel>(),
      child: ReactiveFormConfig(
        validationMessages: <String, ValidationMessageFunction>{
          ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
        },
        child: ReactiveFormBuilder(
            form: () => normalSummaryForm(),
            builder: (context, formGroup, child) {
              return const NormalSummaryScreen();
            }),
      ),
    );
  }
}
