import 'package:flutter/material.dart';

import 'filter_hospital.dart';

class HospitalScreen extends StatelessWidget {
  const HospitalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HospitalFilter(),
        const Center(
          child: Text('Hospital Screen'),
        ),
      ],
    );
  }
}
