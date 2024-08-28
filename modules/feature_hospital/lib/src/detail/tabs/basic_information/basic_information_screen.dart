import 'package:core_utils/core_utils.dart';
import 'basic_information_section.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'basic_information_form.dart';
import 'basic_information_model.dart';

class BasicInformationScreen extends StatelessWidget {
  const BasicInformationScreen({super.key, this.hospitalId});
  final String? hospitalId;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
          form: () => basicInformationForm()..markAllAsTouched(),
          builder: (context, form, _) {
            return Provider(
              create: (_) => GetIt.I<BasicInformationModel>()
                ..fetchData(form, hospitalId: hospitalId),
              child: const BasicInformationSection(),
            );
          }),
    );
  }
}
