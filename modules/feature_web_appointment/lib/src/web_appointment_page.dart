import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'web_appointment_model.dart';
import 'web_appointment_screen.dart';

@RoutePage(name: Routes.webAppointmentsRoute)
class WebAppointmentPage extends StatefulWidget {
  const WebAppointmentPage({super.key});

  @override
  State<WebAppointmentPage> createState() => _WebAppointmentPageState();
}

class _WebAppointmentPageState extends State<WebAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<WebAppointmentModel>()..getWebBookingAdmin(),
      child: const LayoutView(
        selectedIndex: 3,
        page: WebAppointmentScreen(),
      ),
    );
  }
}
