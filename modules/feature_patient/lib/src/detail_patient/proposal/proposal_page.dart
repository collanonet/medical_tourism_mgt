import 'package:core_network/entities.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:core_utils/core_utils.dart';
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
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
        form: () => proposalForm()..markAllAsTouched(),
        builder: (context, formGroup, child) {
          return Provider(
              create: (context) =>
                  GetIt.I<ProposalModel>()..init(patient?.id ?? '',formGroup),
              child: const ProposalScreen());
        },
      ),
    );
  }
}
