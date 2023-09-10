import 'package:feature_patient/src/patient/filter_patient.dart';
import 'package:flutter/cupertino.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PatientFilter(),
        Center(
          child: Text('Patient Screen'),
        ),
      ],
    );
  }
}
