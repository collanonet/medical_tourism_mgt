import 'package:core_l10n/l10n.dart';
import 'package:core_network/entities.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'proposal_form.dart';
import 'proposal_model.dart';
import 'proposal_screen.dart';

class ProposalPage extends StatelessWidget {
  const ProposalPage({
    super.key,
    this.patient,
  });
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<ProposalModel>(),
      child: ReactiveFormConfig(
        validationMessages: <String, ValidationMessageFunction>{
          ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
        },
        child: ReactiveFormBuilder(
          form: () => proposalForm(),
          builder: (context, formGroup, child) {
            return const ProposalScreen();
          },
        ),
      ),
    );
  }
}
