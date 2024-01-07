import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../filter_process_chart_form.dart';
import 'itinerary_simplified_form.dart';
import 'itinerary_simplified_model.dart';
import 'itinerary_simplified_screen.dart';

@RoutePage()
class ItinerarySimplifiedPage extends StatelessWidget {
  const ItinerarySimplifiedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<ItinerarySimplifiedModel>(),
      child: ReactiveFormConfig(
        validationMessages: validationMessagesFilterPatient(context),
        child: ReactiveFormBuilder(
            form: () => itinerarySimplifiedForm(),
            builder: (context, formGroup, child) {
              return const LayoutView(
                selectedIndex: 4,
                page: ItinerarySimplifiedScreen(),
              );
            }),
      ),
    );
  }
}
