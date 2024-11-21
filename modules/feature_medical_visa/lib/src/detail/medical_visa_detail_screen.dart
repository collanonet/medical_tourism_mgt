// Flutter imports:
import 'package:core_network/core_network.dart';
import 'package:feature_patient/feature_patient.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import 'medical_visa_detail_model.dart';

class MedicalVisaDetailScreen extends StatefulWidget {
  const MedicalVisaDetailScreen({
    super.key,
  });

  @override
  State<MedicalVisaDetailScreen> createState() =>
      _MedicalVisaDetailScreenState();
}

class _MedicalVisaDetailScreenState extends State<MedicalVisaDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '医療ビザ管理',
                style: context.textTheme.titleMedium,
              ),
            ],
          ),
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  context.appTheme.spacing.borderRadiusMedium),
              color: Colors.white,
            ),
            child: ValueListenableBuilder(
                valueListenable:
                    context.watch<MedicalVisaDetailModel>().medicalRecord,
                builder: (context, value, _) {
                  return Skeletonizer(
                    enabled: value.loading,
                    child: ValueListenableBuilder(
                        valueListenable:
                            context.watch<MedicalVisaDetailModel>().patientData,
                        builder: (context, patient, _) {
                          return value.hasData ? MedicalVisaPage(
                            patient: patient.data,
                            id: value.requireData.id,
                          ) : Center(child: CircularProgressIndicator());
                        }),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
