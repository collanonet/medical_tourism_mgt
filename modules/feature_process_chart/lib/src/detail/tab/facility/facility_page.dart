import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:core_utils/core_utils.dart';
import 'facility_form.dart';
import 'facility_model.dart';
import 'facility_screen.dart';

class FacilityPage extends StatelessWidget {
  const FacilityPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
        form: () => facilityForm()..markAllAsTouched(),
        builder: (context, formGroup, child) {
          return Provider(
            create: (context) => GetIt.I<FacilityModel>()..fetchData(formGroup,id),
            child: const FacilityScreen(),
          );
        },
      ),
    );
  }
}
