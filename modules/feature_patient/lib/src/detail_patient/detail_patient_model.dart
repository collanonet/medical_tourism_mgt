import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class DetailPatientModel with ChangeNotifier {
  DetailPatientModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  late Patient _patient;
  Patient get patient => _patient;
  Future<void> initialData(Patient patient) async {
    _patient = patient;
    notifyListeners();
  }
}
