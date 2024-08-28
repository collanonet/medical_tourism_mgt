// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import 'medical_payment_details_model.dart';
import 'medical_payment_details_screen.dart';

class MedicalPaymentDetailsPage extends StatelessWidget {
  const MedicalPaymentDetailsPage({
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
            GetIt.I<MedicalPaymentDetailModel>()..fetchMedicalPayment(id: id!),
        child: Builder(builder: (context) {
          return ValueListenableBuilder(
            valueListenable:
                context.read<MedicalPaymentDetailModel>().medicalPaymentData,
            builder: (context, value, child) {
              return Skeletonizer(
                enabled: value.loading,
                child: MedicalPaymentDetailScreen(
                  id: id,
                ),
              );
            },
          );
        }));
  }
}
