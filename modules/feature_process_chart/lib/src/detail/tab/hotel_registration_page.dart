import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../filter_process_chart_form.dart';
import 'hotel_registration_form.dart';
import 'hotel_registration_model.dart';
import 'hotel_registration_screen.dart';

class HotelRegistrationPage extends StatelessWidget {
  const HotelRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessagesFilterPatient(context),
      child: ReactiveFormBuilder(
          form: () => hotelRegistrationForm()..markAllAsTouched(),
          builder: (context, formGroup, child) {
            return Provider(
              create: (context) => GetIt.I<HotelRegistrationModel>()
                ..fetchHotelregister(formGroup),
                child: const HotelRegistrationScreen(),
            );
          }),
    );
  }
}
