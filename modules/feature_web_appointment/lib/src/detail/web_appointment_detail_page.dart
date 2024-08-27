import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:core_utils/core_utils.dart';
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
      page: Provider(
        create: (context) =>
            GetIt.I<WebAppointmentDetailModel>()..getReservationById(id: id),
        child: Builder(builder: (context) {
          return ReactiveFormConfig(
            validationMessages: validationMessages,
            child: ReactiveFormBuilder(
                form: () => context.read<WebAppointmentDetailModel>().formGroup
                  ..markAllAsTouched(),
                builder: (context, formGroup, child) {
                  return const WebAppointmentDetailScreen();
                }),
          );
        }),
      ),
    );
  }
}
