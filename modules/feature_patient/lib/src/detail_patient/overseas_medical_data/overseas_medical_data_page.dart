// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'overseas_medical_data_model.dart';
import 'overseas_medical_data_screen.dart';

class OverseasMedicalDataPage extends StatelessWidget {
  const OverseasMedicalDataPage({
    super.key,
    this.patient,
  });
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) =>
          GetIt.I<OverseasMedicalDataModel>()..initialData(patient: patient),
      child: Builder(
        builder: (context) {
          return OverseasMedicalDataScreen(
            onRefresh: () {
              context.read<OverseasMedicalDataModel>().initialData(
                    patient: patient,
                  );
            },
          );
        }
      ),
    );
  }
}
