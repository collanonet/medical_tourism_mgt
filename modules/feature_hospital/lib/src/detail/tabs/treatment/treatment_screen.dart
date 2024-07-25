import 'package:feature_hospital/src/detail/tabs/treatment/treatment_section.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'treatment_form.dart';
import 'treatment_model.dart';

class TreatmentScreen extends StatefulWidget {
  const TreatmentScreen({super.key, required this.hospitalId});
  final String hospitalId;
  @override
  State<TreatmentScreen> createState() => _TreatmentScreenState();
}

class _TreatmentScreenState extends State<TreatmentScreen> {
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (error) => 'This field is required',
      },
      child: ReactiveFormBuilder(
          form: () =>
              treatmentForm(hospitalId: widget.hospitalId)..markAllAsTouched(),
          builder: (context, form, _) {
            return Provider(
              create: (context) => GetIt.I<TreatmentModle>()..fetchTreatmentMenuTele(form, widget.hospitalId),
              child: const TreatmentSection(),
            );
          }),
    );
  }
}
