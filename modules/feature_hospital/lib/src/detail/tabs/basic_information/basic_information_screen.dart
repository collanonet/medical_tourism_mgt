import 'package:feature_hospital/src/detail/tabs/basic_information/basic_information_section.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'basic_information_form.dart';
import 'basic_information_model.dart';

class BasicInformationScreen extends StatefulWidget {
  const BasicInformationScreen({super.key});

  @override
  State<BasicInformationScreen> createState() => _BasicInformationScreenState();
}

class _BasicInformationScreenState extends State<BasicInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (error) => 'This field is required',
      },
      child: ReactiveFormBuilder(
          form: () => basicInformationForm(),
          builder: (context, form, _) {
            return Provider(
              create: (_) => GetIt.I<BasicInformationModel>()..fetchData(form),
              child: const BasicInformationSection(),
            );
          }),
    );
  }
}
