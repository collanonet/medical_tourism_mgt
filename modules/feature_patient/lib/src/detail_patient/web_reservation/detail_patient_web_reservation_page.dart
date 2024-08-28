// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'detail_patient_web_reservation_model.dart';
import 'detail_patient_web_reservation_screen.dart';

class DetailPatientWebReservationPage extends StatelessWidget {
  const DetailPatientWebReservationPage({
    super.key,
    this.patient,
  });
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    logger.d('patient: ${patient?.id}');
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: Provider(
        create: (context) => GetIt.I<DetailPatientWebReservationModel>()
          ..getPatientById(patient?.id ?? ''),
        child: Builder(builder: (context) {
          return ReactiveFormBuilder(
              form: () =>
                  context.read<DetailPatientWebReservationModel>().formGroup
                    ..markAllAsTouched(),
              builder: (context, formGroup, child) {
                return const DetailPatientWebReservationScreen();
              });
        }),
      ),
    );
  }
}
