import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../filter_process_chart_form.dart';
import 'facility_form.dart';
import 'facility_model.dart';
import 'facility_screen.dart';

class FacilityPage extends StatelessWidget {
  const FacilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<FacilityModel>(),
      child: ReactiveFormConfig(
        validationMessages: validationMessagesFilterPatient(context),
        child: ReactiveFormBuilder(
            form: () => facilityForm(),
            builder: (context, formGroup, child) {
              return const FacilityScreen();
            }),
      ),
    );
  }
}
