import 'package:core_l10n/l10n.dart';
import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'basic_info_form.dart';
import 'basic_info_model.dart';
import 'basic_info_screen.dart';

class BasicInformationPage extends StatelessWidget {
  const BasicInformationPage({
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
          form: () => basicInfoForm(),
          builder: (context, formGroup, child) {
          return ChangeNotifierProvider(
            create: (context) =>
                GetIt.I<BasicInformationModel>()..initialData(patient: patient, formGroup: formGroup),
            child: BasicInformationScreen(
              patient: patient,
            ),
          );
        }
      ),
    );
  }
}
