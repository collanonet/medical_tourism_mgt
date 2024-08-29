// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_utils/core_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'g_and_a_model.dart';
import 'q_and_a_form.dart';
import 'q_and_a_section.dart';

class QAndAScreen extends StatefulWidget {
  const QAndAScreen({super.key, required this.hospitalId});
  final String hospitalId;

  @override
  State<QAndAScreen> createState() => _QAndAScreenState();
}

class _QAndAScreenState extends State<QAndAScreen> {
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
          form: () => qAndAForm(hospital: widget.hospitalId),
          builder: (context, form, _) {
            return Provider(
              create: (context) => GetIt.I<QAndAModel>()
                ..fetchData(hospitalId: widget.hospitalId),
              child: const QAndASection(),
            );
          }),
    );
  }
}
