import 'package:core_network/core_network.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class DomesticMedicalDataModel with ChangeNotifier {
  DomesticMedicalDataModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  late Patient _patient;

  Patient get patient => _patient;

  Future<void> initialData({Patient? patient, String? id}) async {
    notifyListeners();
  }
}
