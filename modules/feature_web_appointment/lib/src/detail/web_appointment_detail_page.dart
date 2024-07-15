import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_network/core_network.dart';
import 'package:feature_patient/feature_patient.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../filter_web_appointment_form.dart';
import 'web_appointment_detail_form.dart';
import 'web_appointment_detail_model.dart';
import 'web_appointment_detail_screen.dart';

@RoutePage()
class WebAppointmentDetailPage extends StatelessWidget {
  const WebAppointmentDetailPage({
    super.key,
    @PathParam('id') this.id,
  });

  final String? id;
  @override
  Widget build(BuildContext context) {
    return LayoutView(
      selectedIndex: 3,
      page: ReactiveFormConfig(
        validationMessages: validationMessagesFilterPatient(context),
        child: ReactiveFormBuilder(
            form: () => formWebAppointment(id: id)..markAllAsTouched(),
            builder: (context, formGroup, child) {
              return Provider(
                  create: (context) => GetIt.I<WebAppointmentDetailModel>()
                    ..getWebBookingAdmin(id: id, formGroup: formGroup),
                  child: const WebAppointmentDetailScreen());
            }),
      ),
    );
  }
}
