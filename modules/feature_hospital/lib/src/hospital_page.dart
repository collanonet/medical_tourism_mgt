import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:feature_hospital/src/hospital_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HospitalPage extends StatefulWidget {
  const HospitalPage({super.key});

  @override
  State<HospitalPage> createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  @override
  Widget build(BuildContext context) {
    return const SideBarMenu(
      page: HospitalScreen(),
    );
  }
}
