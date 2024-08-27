import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../filter_process_chart_form.dart';
import 'package:core_utils/core_utils.dart';
import 'hotel_registration_model.dart';
import 'hotel_search_form.dart';
import 'hotel_search_screen.dart';

class HotelSearchPage extends StatelessWidget {
  const HotelSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
        form: () => hotelSearchForm()..markAllAsTouched(),
        builder: (context, formGroup, child) {
          return Provider(
            create: (context) =>
                GetIt.I<HotelRegistrationModel>()..fetchHotelregister(),
            child: const HotelSearchScreen(),
          );
        },
      ),
    );
  }
}
