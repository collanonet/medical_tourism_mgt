import 'web_reservation_section.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'web_reservation_form.dart';

class WebReservationScreen extends StatefulWidget {
  const WebReservationScreen({super.key});

  @override
  State<WebReservationScreen> createState() => _WebReservationScreenState();
}

class _WebReservationScreenState extends State<WebReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (error) => 'This field is required',
      },
      child: ReactiveFormBuilder(
          form: () => webReservationForm(),
          builder: (context, form, _) {
            return const WebReservationSection();
          }),
    );
  }
}
