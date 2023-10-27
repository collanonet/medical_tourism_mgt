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

  AsyncData<Patient> _patient = const AsyncData<Patient>();
  AsyncData<Patient> get patient => _patient;
  Future<void> initialData({Patient? patient, String? id}) async {
    _patient = const AsyncData<Patient>(loading: true);
    // notifyListeners();

    try {
      if (patient == null) {
        if (id != null) {
          var result = await patientRepository.patient(id);
          _patient = AsyncData<Patient>(data: result);
        }
      } else {
        _patient = AsyncData<Patient>(data: patient);
      }
    } catch (error) {
      _patient = AsyncData<Patient>(error: error);
    } finally {
      notifyListeners();
    }
  }
}
