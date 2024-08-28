import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:core_utils/core_utils.dart';
import 'itinerary_form.dart';
import 'itinerary_model.dart';
import 'itinerary_screen.dart';

class ItineraryPage extends StatelessWidget {
  const ItineraryPage({super.key,required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
        form: () => itineraryForm(),
        builder: (context, formGroup, child) {
          return Provider(
            create: (context) =>
                GetIt.I<ItineraryModel>()..fetchItinerary(formGroup,id: id),
            child: const ItineraryScreen(),
          );
        },
      ),
    );
  }
}
