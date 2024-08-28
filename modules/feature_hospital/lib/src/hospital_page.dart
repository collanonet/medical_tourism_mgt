// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_utils/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'hospital_model.dart';
import 'hospital_screen.dart';

@RoutePage(name: Routes.hospitalsRoute)
class HospitalPage extends StatefulWidget {
  const HospitalPage({super.key});

  @override
  State<HospitalPage> createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<HospitalModel>()..fetchHospitals(),
      child: const LayoutView(
        selectedIndex: 5,
        page: HospitalScreen(),
      ),
    );
  }
}
