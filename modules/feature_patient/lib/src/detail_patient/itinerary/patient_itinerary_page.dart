import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_process_chart/data_process_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'itinerary_form.dart';
import 'patient_itinerary_model.dart';
import 'patient_itinerary_screen.dart';

class PatientItineraryPage extends StatelessWidget {
  const PatientItineraryPage({super.key, required this.patient});

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
        form: () => itineraryForm()..markAllAsTouched(),
        builder: (context, formGroup, child) {
          return Provider(
            create: (context) => PatientItineraryModel(
              processChartRepository: GetIt.I<ProcessChartRepository>(),
              patientId: patient.id,
            )..fetchData(formGroup),
            child: PatientItineraryScreen(patient: patient),
          );
        },
      ),
    );
  }
}
