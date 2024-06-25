import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../filter_process_chart_form.dart';
import 'itinerary_simple_version_form.dart';
import 'itinerary_simple_version_model.dart';
import 'itinerary_simple_version_sreen.dart';

class ItinerarySimpleVersionPage extends StatelessWidget {
  const ItinerarySimpleVersionPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Provider(
      create: (context) => GetIt.I<ItinerarySimpleVersionModel>(),
      child: ReactiveFormConfig(
        validationMessages: validationMessagesFilterPatient(context),
        child: ReactiveFormBuilder(
            form: () => inerarySimpleVersionForm(),
            builder: (context, formGroup, child) {
              return const ItinerarySimpleVersionScreen();
            }),
      ),
    );
  }
}