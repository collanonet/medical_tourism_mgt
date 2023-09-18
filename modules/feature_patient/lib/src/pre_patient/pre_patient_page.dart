import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../patient_model.dart';
import 'pre_patient_screen.dart';

@RoutePage()
class PrePatientPage extends StatefulWidget {
  const PrePatientPage({super.key});

  @override
  State<PrePatientPage> createState() => _PrePatientPageState();
}

class _PrePatientPageState extends State<PrePatientPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<PatientModel>(),
      child: const LayoutView(
        selectedIndex: 0,
        page: PrePatientScreen(),
      ),
    );
  }
}
