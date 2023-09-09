import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:feature_pre_patient/src/pre_patient_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PrePatientPage extends StatefulWidget {
  const PrePatientPage({super.key});

  @override
  State<PrePatientPage> createState() => _PrePatientPageState();
}

class _PrePatientPageState extends State<PrePatientPage> {
  @override
  Widget build(BuildContext context) {
    return const SideBarMenu(
      page: PrePatientScreen(),
    );
  }
}
