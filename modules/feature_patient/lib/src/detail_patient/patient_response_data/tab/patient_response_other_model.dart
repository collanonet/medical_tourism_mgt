import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class PatientResponseOtherModel {
  PatientResponseOtherModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;
}
