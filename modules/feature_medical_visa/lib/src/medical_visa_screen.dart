import 'package:flutter/material.dart';

import 'filter_medical_visa.dart';

class MedicalVisaScreen extends StatelessWidget {
  const MedicalVisaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MedicalVisaFilter(),
        Center(
          child: Text('Medical Visa Screen'),
        ),
      ],
    );
  }
}
