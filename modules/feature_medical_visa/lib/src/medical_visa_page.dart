import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:feature_medical_visa/src/medical_visa_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MedicalVisaPage extends StatefulWidget {
  const MedicalVisaPage({super.key});

  @override
  State<MedicalVisaPage> createState() => _MedicalVisaPageState();
}

class _MedicalVisaPageState extends State<MedicalVisaPage> {
  @override
  Widget build(BuildContext context) {
    return const SideBarMenu(
      page: MedicalVisaScreen(),
    );
  }
}
