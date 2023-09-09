import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:feature_patient/src/patient_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  @override
  Widget build(BuildContext context) {
    return const SideBarMenu(
      page: PatientScreen(),
    );
  }
}
