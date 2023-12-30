import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../filter_web_appointment_form.dart';
import 'web_appointment_detail_form.dart';
import 'web_appointment_detail_model.dart';
import 'web_appointment_detail_screen.dart';

class WebAppointmentDetailPage extends StatelessWidget {
  const WebAppointmentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<WebAppointmentDetailModel>(),
      child: ReactiveFormConfig(
        validationMessages: validationMessagesFilterPatient(context),
        child: ReactiveFormBuilder(
            form: () => formWebAppointment(),
            builder: (context, formGroup, child) {
              return const WebAppointmentDetailScreen();
            }),
      ),
    );
  }
}
