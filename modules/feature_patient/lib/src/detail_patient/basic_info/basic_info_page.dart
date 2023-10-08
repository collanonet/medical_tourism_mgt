import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'basic_info_model.dart';
import 'basic_info_screen.dart';

class BasicInformationPage extends StatelessWidget {
  const BasicInformationPage({
    super.key,
    required this.patient,
  });
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          GetIt.I<BasicInformationModel>()..initialData(patient),
      child: const BasicInformationScreen(),
    );
  }
}
