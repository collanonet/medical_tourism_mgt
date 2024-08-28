// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:data_auth/data_auth.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';

@injectable
class MedicalVisaDetailModel with ChangeNotifier {
  MedicalVisaDetailModel({
    required this.authRepository,
    required this.patientRepository,
  });

  final AuthRepository authRepository;
  final PatientRepository patientRepository;
}
