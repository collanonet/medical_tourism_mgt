import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../filter_process_chart_form.dart';
import 'itinerary_form.dart';
import 'itinerary_model.dart';
import 'itinerary_screen.dart';
import 'related_parties_form.dart';
import 'related_parties_model.dart';
import 'related_parties_screen.dart';

class RelatedPartiesPage extends StatelessWidget {
  const RelatedPartiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<RelatedPartiesModel>(),
      child: ReactiveFormConfig(
        validationMessages: validationMessagesFilterPatient(context),
        child: ReactiveFormBuilder(
            form: () => relatedPartiesForm(),
            builder: (context, formGroup, child) {
              return const RelatedPartiesScreen();
            }),
      ),
    );
  }
}
