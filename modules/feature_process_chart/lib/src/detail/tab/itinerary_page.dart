import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../filter_process_chart_form.dart';
import 'itinerary_form.dart';
import 'itinerary_model.dart';
import 'itinerary_screen.dart';

class ItineraryPage extends StatelessWidget {
  const ItineraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<ItineraryModel>(),
      child: ReactiveFormConfig(
        validationMessages: validationMessagesFilterPatient(context),
        child: ReactiveFormBuilder(
            form: () => itineraryForm(),
            builder: (context, formGroup, child) {
              return const ItineraryScreen();
            }),
      ),
    );
  }
}
