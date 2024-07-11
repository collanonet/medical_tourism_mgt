import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'domestic_medical_data_model.dart';
import 'domestic_medical_data_screen.dart';

class DomesticMedicalDataPage extends StatelessWidget {
  const DomesticMedicalDataPage({
    super.key,
    this.patient,
   this.id,
  });
  final Patient? patient;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) =>
          GetIt.I<DomesticMedicalDataModel>()..fetchDomesticMedicalData(id: id!),
      child: Builder(
        builder: (context) {
          return ValueListenableBuilder(
            valueListenable:
                context.read<DomesticMedicalDataModel>().domesticMedicalData,
            builder: (context, value, child) {
              return Skeletonizer(
                child: DomesticMedicalDataScreen(
                  id: id,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
