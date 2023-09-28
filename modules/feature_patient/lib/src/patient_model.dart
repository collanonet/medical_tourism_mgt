import 'package:core_network/core_network.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:core_utils/core_utils.dart';

@injectable
class PatientModel with ChangeNotifier {
  PatientModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  AsyncData<Paginated<PrePatient>> _prePatientData = const AsyncData();
  AsyncData<Paginated<PrePatient>> get prePatientData => _prePatientData;

  Future<void> prePatients({
    int? page,
    int? limit,
    String? agents,
    String? patient,
  }) {
    _prePatientData = const AsyncData(loading: true);
    notifyListeners();

    return patientRepository
        .prePatients(
      page: page,
      limit: limit,
      agents: agents,
      patient: patient,
    )
        .then((value) {
      _prePatientData = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _prePatientData = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }
}
