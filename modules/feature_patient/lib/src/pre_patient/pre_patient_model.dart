import 'package:core_network/core_network.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:core_utils/core_utils.dart';

@injectable
class PrePatientModel with ChangeNotifier {
  PrePatientModel({
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

  AsyncData<PrePatient> _postPrePatientData = const AsyncData();
  AsyncData<PrePatient> get postPrePatientData => _postPrePatientData;

  Future<void> postPrePatient(
    PrePatient prePatient,
  ) {
    _postPrePatientData = const AsyncData(loading: true);
    notifyListeners();

    return patientRepository.postPrePatient(prePatient).then((value) {
      _postPrePatientData = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _postPrePatientData = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  AsyncData<PrePatient> _putPrePatientData = const AsyncData();
  AsyncData<PrePatient> get putPrePatientData => _putPrePatientData;

  Future<void> putPrePatient(
    PrePatient prePatient,
  ) {
    _putPrePatientData = const AsyncData(loading: true);
    notifyListeners();

    return patientRepository.putPrePatient(prePatient).then((value) {
      _putPrePatientData = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _putPrePatientData = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  AsyncData<bool> _deletePrePatientData = const AsyncData();
  AsyncData<bool>  get deletePrePatientData => _deletePrePatientData;


  Future<void> deletePrePatient(
    String id,
  ) {
    _deletePrePatientData = const AsyncData(loading: true);
    notifyListeners();

    return patientRepository.deletePrePatient(id).then((value) {
      int? index = _prePatientData.data?.items.indexWhere((element) => element.id == id);

      if(index != null && index >= 0) {
        _prePatientData.data?.items[index].isDeleted = true;
      }

      _deletePrePatientData = const AsyncData(data: true);
    }).catchError((error) {
      logger.d(error);
      _deletePrePatientData = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }
}
