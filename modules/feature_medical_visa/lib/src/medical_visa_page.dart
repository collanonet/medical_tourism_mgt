// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_utils/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'medical_visa_model.dart';
import 'medical_visa_screen.dart';

@RoutePage(name: Routes.medicalVisasRoute)
class MedicalVisaPage extends StatefulWidget {
  const MedicalVisaPage({super.key});

  @override
  State<MedicalVisaPage> createState() => _MedicalVisaPageState();
}

class _MedicalVisaPageState extends State<MedicalVisaPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<MedicalVisaModel>()..patients(),
      child: const LayoutView(
        selectedIndex: 2,
        page: MedicalVisaScreen(),
      ),
    );
  }
}
