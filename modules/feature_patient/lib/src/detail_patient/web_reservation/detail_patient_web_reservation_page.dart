import 'package:core_l10n/l10n.dart';
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'detail_patient_web_reservation_form.dart';
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
      validationMessages: <String, ValidationMessageFunction>{
        ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
      },
      child: ReactiveFormBuilder(
          form: () => detailPatientWebReservationForm()..markAllAsTouched(),
          builder: (context, formGroup, child) {
            return Provider(
                create: (context) => GetIt.I<DetailPatientWebReservationModel>()
                  ..getMedicalRecords(
                      patientId: patient?.id, formGroup: formGroup),
                child: const DetailPatientWebReservationScreen());
          }),
    );
  }
}
