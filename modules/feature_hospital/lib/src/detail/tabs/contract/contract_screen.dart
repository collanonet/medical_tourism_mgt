
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'contract_section.dart';
import 'contrant_model.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({super.key, required this.id});
  final String id;
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
      child: Provider(
        create: (context) =>
            GetIt.I<ContrantModel>()..fetchContrant(id: widget.id),
        child: ContractSection(
          id: widget.id,
        ),
      ),
    );
  }
}
