import 'package:flutter/material.dart';

import 'filter_web_appointment.dart';

class WebAppointmentScreen extends StatelessWidget {
  const WebAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WebAppointmentFilter(),
        const Center(
          child: Text('Web Appointment Screen'),
        ),
      ],
    );
  }
}
