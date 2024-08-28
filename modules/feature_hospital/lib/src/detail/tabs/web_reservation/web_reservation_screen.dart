import 'web_reservation_section.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:core_utils/core_utils.dart';

import 'web_reservation_model.dart';

class WebReservationScreen extends StatefulWidget {
  const WebReservationScreen({super.key, required this.hospitalId});
  final String hospitalId;
  @override
  State<WebReservationScreen> createState() => _WebReservationScreenState();
}

class _WebReservationScreenState extends State<WebReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: Provider(
        create: (context) => GetIt.I<WebAppointmentDetailModel>()
          ..getReservationAll(hospitalId: widget.hospitalId),
        child: Builder(builder: (context) {
          return ReactiveFormBuilder(
              form: () => context.read<WebAppointmentDetailModel>().formGroup
                ..markAllAsTouched(),
              builder: (context, formGroup, child) {
                return const WebReservationSection();
              });
        }),
      ),
    );
  }
}
