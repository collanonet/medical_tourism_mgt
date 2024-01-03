import 'package:data_auth/data_auth.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class WebAppointmentDetailModel extends ChangeNotifier {
  WebAppointmentDetailModel({
    required this.authRepository,
    required this.patientRepository,
  });

  final AuthRepository authRepository;
  final PatientRepository patientRepository;
}
