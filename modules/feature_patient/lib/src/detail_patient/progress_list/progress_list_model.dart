import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProgressListModel with ChangeNotifier {
  ProgressListModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  late Patient _patient;
  Patient get patient => _patient;
  Future<void> initialData(Patient patient) async {
    _patient = patient;
    notifyListeners();
  }

//GET_MEDICAL_RECORDS_PROGRESS
  AsyncData<List<MedicalRecordProgress>> _medicalRecordsProgress =
      const AsyncData();
  AsyncData<List<MedicalRecordProgress>> get medicalRecordsProgress =>
      _medicalRecordsProgress;

  Future<void> getMedicalRecordsProgress(String medicalRecordId) async {
    _medicalRecordsProgress = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .medicalRecordsProgress(medicalRecordId)
        .then((value) {
      _medicalRecordsProgress = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _medicalRecordsProgress = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // post MEDICAL_RECORDS_PROGRESS
  Future<void> postMedicalRecordsProgress(
    MedicalRecordProgressRequest medicalRecordProgressRequest,
  ) async {
    _medicalRecordsProgress = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .postMedicalRecordProgress(medicalRecordProgressRequest)
        .then((value) {
      _medicalRecordsProgress.data?.add(value);
    }).catchError((error) {
      logger.d(error);
      _medicalRecordsProgress = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update MEDICAL_RECORDS_PROGRESS
  Future<void> updateMedicalRecordsProgress(
    String id,
    MedicalRecordProgressRequest medicalRecordProgressRequest,
  ) async {
    _medicalRecordsProgress = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .putMedicalRecordProgress(id, medicalRecordProgressRequest)
        .then((value) {
      // Find from list and update or add
      final index = _medicalRecordsProgress.data?.indexWhere(
            (element) => element.id == id,
          ) ??
          -1;
      if (index >= 0) {
        _medicalRecordsProgress.data?[index] = value;
      } else {
        _medicalRecordsProgress.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
      _medicalRecordsProgress = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }
}
