// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class PatientModel with ChangeNotifier {
  PatientModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  AsyncData<Paginated<Patient>> _patientData = const AsyncData();
  AsyncData<Paginated<Patient>> get patientData => _patientData;

  Future<void> patients({FormGroup? form, String? progress}) async {
    _patientData = const AsyncData(loading: true);
    notifyListeners();

    logger.d(form?.value);
    await patientRepository
        .patients(
      progress: progress,
      patientName: form?.control('patientName').value == null
          ? null
          : form!.control('patientName').value,
      companyAGENTS: form?.control('companyAGENTS').value == null
          ? null
          : form!.control('companyAGENTS').value,
      acceptingHospital: form?.control('acceptingHospital').value == null
          ? null
          : form!.control('acceptingHospital').value,
      type: form?.control('type').value == null
          ? null
          : form!.control('type').value,
      salesStaff: form?.control('salesStaff').value == null
          ? null
          : form!.control('salesStaff').value,
      dateOfEntryfrom: form?.control('dateOfEntryfrom').value == null
          ? null
          : form!.control('dateOfEntryfrom').value.toString(),
      dateOfEntryto: form?.control('dateOfEntryto').value == null
          ? null
          : form!.control('dateOfEntryto').value.toString(),
      medicalDayfrom: form?.control('medicalDayfrom').value == null
          ? null
          : form!.control('medicalDayfrom').value.toString(),
      medicalDayto: form?.control('medicalDayto').value == null
          ? null
          : form!.control('medicalDayto').value.toString(),
      returnDatefrom: form?.control('returnDatefrom').value == null
          ? null
          : form!.control('returnDatefrom').value.toString(),
      returnDateto: form?.control('returnDateto').value == null
          ? null
          : form!.control('returnDateto').value.toString(),
    )
        .then((value) {
      logger.d(value.items.length);
      _patientData = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _patientData = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  AsyncData<Patient> _postPatientData = const AsyncData();
  AsyncData<Patient> get postPatientData => _postPatientData;

  Future<void> postPatient(
    PatientRequest patient,
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
  AsyncData<Patient> get putPatientData => _putPatientData;

  Future<void> putPatient(
    Patient patient,
    PatientRequest patientRequest,
  ) {
    _putPatientData = const AsyncData(loading: true);
    notifyListeners();

    return patientRepository
        .putPatient(patient.id, patientRequest)
        .then((value) {
      _putPatientData = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _putPatientData = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  AsyncData<bool> _deletePatientData = const AsyncData();
  AsyncData<bool> get deletePatientData => _deletePatientData;

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
