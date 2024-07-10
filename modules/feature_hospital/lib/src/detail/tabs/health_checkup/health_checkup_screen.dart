import 'package:feature_hospital/src/detail/tabs/health_checkup/health_checkup_section.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'health_checkup_form.dart';
import 'health_checkup_model.dart';

class HealthCheckupScreen extends StatefulWidget {
  const HealthCheckupScreen({super.key});

  @override
  State<HealthCheckupScreen> createState() => _HealthCheckupScreenState();
}

class _HealthCheckupScreenState extends State<HealthCheckupScreen> {
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (error) => 'This field is required',
      },
      child: ReactiveFormBuilder(
          form: () => healthCheckupForm(),
          builder: (context, form, _) {
            return Provider(
              create: (context) => GetIt.I<HealthModel>()..fetchHeadInfo(form),
              child: const HealthCheckupSection(),
            );
          }),
    );
  }
}
