// pick_medical_data_file

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'pick_medical_data_file_model.dart';
import 'pick_medical_data_file_screen.dart';

class PickMedicalDataFilePage extends StatelessWidget {
  const PickMedicalDataFilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<PickMedicalDataFileModel>(),
      child: const PickMedicalDataFileScreen(),
    );
  }
}
