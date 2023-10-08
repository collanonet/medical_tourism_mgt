import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class OverseasMedicalDataModel with ChangeNotifier {
  OverseasMedicalDataModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  late Patient _patient;
  Patient get patient => _patient;
  Future<void> initialData(Patient patient) async {
    _patient = patient;
    notifyListeners();
  }

//GET_MEDICAL_RECORDS_OVERSEAS
  AsyncData<List<MedicalRecordOversea>> _medicalRecordsOverseas =
      const AsyncData();
  AsyncData<List<MedicalRecordOversea>> get medicalRecordsOverseas =>
      _medicalRecordsOverseas;

  Future<void> getMedicalRecordsOverseas(String medicalRecordId) async {
    _medicalRecordsOverseas = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .medicalRecordsOverseas(medicalRecordId)
        .then((value) {
      _medicalRecordsOverseas = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _medicalRecordsOverseas = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });

    if (_medicalRecordsOverseas.data != null &&
        _medicalRecordsOverseas.data!.isNotEmpty) {
      await getMedicalRecordsOverseasData(_medicalRecordsOverseas.data![0].id);
    }
  }

  // post MEDICAL_RECORDS_OVERSEAS
  Future<void> postMedicalRecordsOverseas(
    MedicalRecordOverseaRequest medicalRecordOverseaRequest,
  ) async {
    _medicalRecordsOverseas = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .postMedicalRecordOversea(medicalRecordOverseaRequest)
        .then((value) {
      _medicalRecordsOverseas.data?.add(value);
    }).catchError((error) {
      logger.d(error);
      _medicalRecordsOverseas = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update MEDICAL_RECORDS_OVERSEAS
  Future<void> updateMedicalRecordsOverseas(
    String id,
    MedicalRecordOverseaRequest medicalRecordOverseaRequest,
  ) async {
    _medicalRecordsOverseas = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .putMedicalRecordOversea(id, medicalRecordOverseaRequest)
        .then((value) {
      // Find from list and update or add
      final index = _medicalRecordsOverseas.data?.indexWhere(
            (element) => element.id == id,
          ) ??
          -1;
      if (index >= 0) {
        _medicalRecordsOverseas.data?[index] = value;
      } else {
        _medicalRecordsOverseas.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
      _medicalRecordsOverseas = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

//GET_MEDICAL_RECORDS_OVERSEAS_DATA
  AsyncData<List<MedicalRecordOverseaData>> _medicalRecordsOverseasData =
      const AsyncData();
  AsyncData<List<MedicalRecordOverseaData>> get medicalRecordsOverseasData =>
      _medicalRecordsOverseasData;

  Future<void> getMedicalRecordsOverseasData(String medicalRecordId) async {
    _medicalRecordsOverseasData = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .medicalRecordsOverseasData(medicalRecordId)
        .then((value) {
      _medicalRecordsOverseasData = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _medicalRecordsOverseasData = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // post MEDICAL_RECORDS_OVERSEAS_DATA
  Future<void> postMedicalRecordsOverseasData(
    MedicalRecordOverseaDataRequest medicalRecordOverseaDataRequest,
  ) async {
    _medicalRecordsOverseasData = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .postMedicalRecordOverseaData(medicalRecordOverseaDataRequest)
        .then((value) {
      _medicalRecordsOverseasData.data?.add(value);
    }).catchError((error) {
      logger.d(error);
      _medicalRecordsOverseasData = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  Future<void> updateMedicalRecordsOverseasData(
    String id,
    MedicalRecordOverseaDataRequest medicalRecordOverseaDataRequest,
  ) async {
    _medicalRecordsOverseasData = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .putMedicalRecordOverseaData(id, medicalRecordOverseaDataRequest)
        .then((value) {
      // Find from list and update or add
      final index = _medicalRecordsOverseasData.data?.indexWhere(
            (element) => element.id == id,
          ) ??
          -1;
      if (index >= 0) {
        _medicalRecordsOverseasData.data?[index] = value;
      } else {
        _medicalRecordsOverseasData.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
      _medicalRecordsOverseasData = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }
}
