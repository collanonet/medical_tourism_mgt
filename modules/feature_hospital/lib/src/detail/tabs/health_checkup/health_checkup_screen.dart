// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_utils/core_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'health_checkup_model.dart';
import 'health_checkup_section.dart';

class HealthCheckupScreen extends StatefulWidget {
  const HealthCheckupScreen({super.key, required this.id});
  final String id;
  @override
  State<HealthCheckupScreen> createState() => _HealthCheckupScreenState();
}

class _HealthCheckupScreenState extends State<HealthCheckupScreen> {
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: Provider(
        create: (context) => GetIt.I<HealthModel>()..fetchHeadInfo(id: widget.id),
        child: HealthCheckupSection(
          id: widget.id,
        ),
      ),
    );
  }
}
