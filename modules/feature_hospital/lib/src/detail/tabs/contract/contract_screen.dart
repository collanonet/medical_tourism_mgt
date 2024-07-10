import 'package:feature_hospital/src/detail/tabs/contract/contract_section.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'contract_form.dart';
import 'contrant_model.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({super.key});

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (error) => 'This field is required',
      },
      child: ReactiveFormBuilder(
          form: () => contractForm(),
          builder: (context, form, _) {
            return Provider(
              create: (context) =>
                  GetIt.I<ContrantModel>()..fetchContrant(form),
              child: const ContractSection(),
            );
          }),
    );
  }
}
