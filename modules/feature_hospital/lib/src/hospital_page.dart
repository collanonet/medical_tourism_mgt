import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_utils/routes.dart';
import 'package:feature_hospital/src/hospital_screen.dart';
import 'package:flutter/material.dart';

@RoutePage(name: Routes.hospitalsRoute)
class HospitalPage extends StatefulWidget {
  const HospitalPage({super.key});

  @override
  State<HospitalPage> createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  @override
  Widget build(BuildContext context) {
    return const LayoutView(
      selectedIndex: 4,
      page: HospitalScreen(),
    );
  }
}
