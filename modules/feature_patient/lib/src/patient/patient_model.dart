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

  AsyncData<Paginated<Patient>> _patientData = const AsyncData();
  AsyncData<Paginated<Patient>> get patientData => _patientData;

  Future<void> patients() {
    _patientData = const AsyncData(loading: true);
    notifyListeners();

    return patientRepository.patients().then((value) {
      _patientData = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _patientData = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  AsyncData<Patient> _postPatientData = const AsyncData();
  AsyncData<Patient>  get postPatientData => _postPatientData;

  Future<void> postPatient(
    Patient patient,
  ) {
    _postPatientData = const AsyncData(loading: true);
    notifyListeners();

    return patientRepository.postPatient(patient).then((value) {
      _postPatientData = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _postPatientData = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  AsyncData<Patient> _putPatientData = const AsyncData();
  AsyncData<Patient>  get putPatientData => _putPatientData;

  Future<void> putPatient(
    Patient patient,
  ) {
    _putPatientData = const AsyncData(loading: true);
    notifyListeners();

    return patientRepository.putPatient(patient).then((value) {
      _putPatientData = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _putPatientData = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  AsyncData<bool> _deletePatientData = const AsyncData();
  AsyncData<bool>  get deletePatientData => _deletePatientData;

  Future<void> deletePatient(
    String id,
  ) {
    _deletePatientData = const AsyncData(loading: true);
    notifyListeners();

    return patientRepository.deletePatient(id).then((value) {
      _patientData.data?.items.removeWhere((element) => element.id == id);
      _deletePatientData = const AsyncData(data: true);
    }).catchError((error) {
      logger.d(error);
      _deletePatientData = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

}
