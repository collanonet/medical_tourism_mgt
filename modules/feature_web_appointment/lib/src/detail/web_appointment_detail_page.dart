// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_utils/core_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
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
      page: Provider(
        create: (context) {
          final model = GetIt.I<WebAppointmentDetailModel>();
          if (id != null) {
            model.getReservationById(id: id);
          }
          return model;
        },
        builder: (context, child) {
          final model = context.read<WebAppointmentDetailModel>();
          return ReactiveFormConfig(
            validationMessages: validationMessages,
            child: ReactiveForm(
              formGroup: model.formGroup,
              child: const WebAppointmentDetailScreen(),
            ),
          );
        },
      ),
    );
  }
}
