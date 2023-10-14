import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'basic_info_form.dart';

@injectable
class BasicInformationModel with ChangeNotifier {
  BasicInformationModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  late Patient _patient;
  Patient get patient => _patient;
  Future<void> initialData({
    Patient? patient,
    String? id,
    required FormGroup formGroup,
  }) async {
    if (patient != null) {
      try {
        _patient = patient;
        await getPatientNames(patient.id);
        await getPatientNationalities(patient.id);
        await getPatientPassports(patient.id);
        await getMedicalRecords(patientId: patient.id, formGroup: formGroup);
      } catch (e) {
        logger.d(e);
      } finally {
        notifyListeners();
      }
    }
  }

  //GET_PATIENT_NAMES
  AsyncData<List<PatientName>> _patientNames = const AsyncData();
  AsyncData<List<PatientName>> get patientNames => _patientNames;

  Future<void> getPatientNames(String patientId) async {
    _patientNames = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository.patientNamesByPatient(patientId).then((value) {
      _patientNames = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _patientNames = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // post PATIENT_NAMES
  Future<void> postPatientNames(
    PatientNameRequest patientNameRequest,
  ) async {
    _patientNames = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository.postPatientName(patientNameRequest).then((value) {
      _patientNames.data?.add(value);
    }).catchError((error) {
      logger.d(error);
      _patientNames = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update PATIENT_NAMES
  Future<void> updatePatientNames(
    String id,
    PatientNameRequest patientNameRequest,
  ) async {
    _patientNames = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .putPatientName(id, patientNameRequest)
        .then((value) {
      // Find from list and update or add
      final index = _patientNames.data?.indexWhere(
            (element) => element.id == id,
          ) ??
          -1;
      if (index >= 0) {
        _patientNames.data?[index] = value;
      } else {
        _patientNames.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
      _patientNames = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

//GET_PATIENT_NATIONALITIES
  AsyncData<List<PatientNationality>> _patientNationalities = const AsyncData();
  AsyncData<List<PatientNationality>> get patientNationalities =>
      _patientNationalities;

  Future<void> getPatientNationalities(String patientId) async {
    _patientNationalities = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .patientNationalitiesByPatient(patientId)
        .then((value) {
      _patientNationalities = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _patientNationalities = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // post PATIENT_NATIONALITIES
  Future<void> postPatientNationalities(
    PatientNationalityRequest patientNationalityRequest,
  ) async {
    _patientNationalities = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .postPatientNationality(patientNationalityRequest)
        .then((value) {
      _patientNationalities.data?.add(value);
    }).catchError((error) {
      logger.d(error);
      _patientNationalities = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update PATIENT_NATIONALITIES
  Future<void> updatePatientNationalities(
    String id,
    PatientNationalityRequest patientNationalityRequest,
  ) async {
    _patientNationalities = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .putPatientNationality(id, patientNationalityRequest)
        .then((value) {
      // Find from list and update or add
      final index = _patientNationalities.data?.indexWhere(
            (element) => element.id == id,
          ) ??
          -1;
      if (index >= 0) {
        _patientNationalities.data?[index] = value;
      } else {
        _patientNationalities.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
      _patientNationalities = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

//GET_PATIENT_PASSPORTS
  AsyncData<List<PatientPassport>> _patientPassports = const AsyncData();
  AsyncData<List<PatientPassport>> get patientPassports => _patientPassports;

  Future<void> getPatientPassports(String patientId) async {
    _patientPassports = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository.patientPassportsByPatient(patientId).then((value) {
      _patientPassports = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _patientPassports = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // post PATIENT_PASSPORTS
  Future<void> postPatientPassports(
    PatientPassportRequest patientPassportRequest,
  ) async {
    _patientPassports = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .postPatientPassport(patientPassportRequest)
        .then((value) {
      _patientPassports.data?.add(value);
    }).catchError((error) {
      logger.d(error);
      _patientPassports = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update PATIENT_PASSPORTS
  Future<void> updatePatientPassports(
    String id,
    PatientPassportRequest patientPassportRequest,
  ) async {
    _patientPassports = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .putPatientPassport(id, patientPassportRequest)
        .then((value) {
      // Find from list and update or add
      final index = _patientPassports.data?.indexWhere(
            (element) => element.id == id,
          ) ??
          -1;
      if (index >= 0) {
        _patientPassports.data?[index] = value;
      } else {
        _patientPassports.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
      _patientPassports = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

//GET_MEDICAL_RECORDS
  AsyncData<MedicalRecord> _medicalRecord = const AsyncData();
  AsyncData<MedicalRecord> get medicalRecord => _medicalRecord;

  Future<void> getMedicalRecords({
    required String patientId,
    required FormGroup formGroup,
  }) async {
    _medicalRecord = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository.medicalRecordsByPatient(patientId).then((value) {
      _medicalRecord = AsyncData(data: value.first);
      insertMedicalRecord(data: value.first, formGroup: formGroup);
    }).catchError((error) {
      logger.d(error);
      _medicalRecord = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
    if (_medicalRecord.data != null) {
      await getMedicalRecordAgents(_medicalRecord.data!.id);
      await getMedicalRecordBudgets(_medicalRecord.data!.id);
      await getMedicalRecordCompanions(_medicalRecord.data!.id);
      await getMedicalRecordHospitals(
        medicalRecordId: _medicalRecord.data!.id,
        formGroup: formGroup,
      );
      await getMedicalRecordInterpreters(_medicalRecord.data!.id);
    }
  }

  void insertMedicalRecord({
    MedicalRecord? data,
    required FormGroup formGroup,
  }) {
    formGroup.control('id').value = data?.id;
    formGroup.control('dateOfBirth').value = data?.dateOfBirth;
    formGroup.control('age').value = data?.age;
    formGroup.control('gender').value = data?.gender;
    formGroup.control('arrivalDate').value = data?.arrivalDate;
    formGroup.control('examinationDate').value = data?.examinationDate;
    formGroup.control('departureDate').value = data?.departureDate;
    formGroup.control('caseNumber').value = data?.caseNumber;
    formGroup.control('receptionDate').value = data?.receptionDate;
    formGroup.control('type').value = data?.type;
    formGroup.control('progress').value = data?.progress;
    formGroup.control('advancePaymentDate').value = data?.advancePaymentDate;
    formGroup.control('paymentMethod').value = data?.paymentMethod;
    formGroup.control('memo').value = data?.memo;
  }

  Future<void> createUpdateMedicalRecords(FormGroup form) async {
    MedicalRecordRequest request = MedicalRecordRequest(
      dateOfBirth: form.control('dateOfBirth').value,
      age: ageCalculator(form.control('dateOfBirth').value),
      gender: form.control('gender').value,
      arrivalDate: form.control('arrivalDate').value,
      examinationDate: form.control('examinationDate').value,
      departureDate: form.control('departureDate').value,
      caseNumber: form.control('caseNumber').value,
      receptionDate: form.control('receptionDate').value,
      type: form.control('type').value,
      progress: form.control('progress').value,
      advancePaymentDate: form.control('advancePaymentDate').value,
      paymentMethod: form.control('paymentMethod').value,
      memo: form.control('memo').value,
      patient: form.control('patient').value,
    );
    if (form.control('id').value != null) {
      await updateMedicalRecords(form.control('id').value, request);
    } else {
      await postMedicalRecords(request);
    }
  }

  // post MEDICAL_RECORDS
  Future<void> postMedicalRecords(
    MedicalRecordRequest medicalRecordRequest,
  ) async {
    _medicalRecord = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .postMedicalRecord(medicalRecordRequest)
        .then((value) {
      _medicalRecord = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _medicalRecord = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update MEDICAL_RECORDS
  Future<void> updateMedicalRecords(
    String id,
    MedicalRecordRequest medicalRecordRequest,
  ) async {
    _medicalRecord = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .putMedicalRecord(id, medicalRecordRequest)
        .then((value) {
      _medicalRecord = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _medicalRecord = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

//GET_MEDICAL_RECORD_AGENTS
  AsyncData<List<MedicalRecordAgent>> _medicalRecordAgents = const AsyncData();
  AsyncData<List<MedicalRecordAgent>> get medicalRecordAgents =>
      _medicalRecordAgents;

  Future<void> getMedicalRecordAgents(String medicalRecordId) async {
    _medicalRecordAgents = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .medicalRecordAgentsByMedicalRecord(medicalRecordId)
        .then((value) {
      _medicalRecordAgents = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _medicalRecordAgents = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // post MEDICAL_RECORD_AGENTS
  Future<void> postMedicalRecordAgents(
    MedicalRecordAgentRequest medicalRecordAgentRequest,
  ) async {
    _medicalRecordAgents = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .postMedicalRecordAgent(medicalRecordAgentRequest)
        .then((value) {
      _medicalRecordAgents.data?.add(value);
    }).catchError((error) {
      logger.d(error);
      _medicalRecordAgents = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update MEDICAL_RECORD_AGENTS
  Future<void> updateMedicalRecordAgents(
    String id,
    MedicalRecordAgentRequest medicalRecordAgentRequest,
  ) async {
    _medicalRecordAgents = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .putMedicalRecordAgent(id, medicalRecordAgentRequest)
        .then((value) {
      // Find from list and update or add
      final index = _medicalRecordAgents.data?.indexWhere(
            (element) => element.id == id,
          ) ??
          -1;
      if (index >= 0) {
        _medicalRecordAgents.data?[index] = value;
      } else {
        _medicalRecordAgents.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
      _medicalRecordAgents = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

// GET_MEDICAL_RECORD_BUDGETS
  AsyncData<List<MedicalRecordBudget>> _medicalRecordBudgets =
      const AsyncData();
  AsyncData<List<MedicalRecordBudget>> get medicalRecordBudgets =>
      _medicalRecordBudgets;

  Future<void> getMedicalRecordBudgets(String medicalRecordId) async {
    _medicalRecordBudgets = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .medicalRecordBudgetsByMedicalRecord(medicalRecordId)
        .then((value) {
      _medicalRecordBudgets = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _medicalRecordBudgets = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // post MEDICAL_RECORD_BUDGETS
  Future<void> postMedicalRecordBudgets(
    MedicalRecordBudgetRequest medicalRecordBudgetRequest,
  ) async {
    _medicalRecordBudgets = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .postMedicalRecordBudget(medicalRecordBudgetRequest)
        .then((value) {
      _medicalRecordBudgets.data?.add(value);
    }).catchError((error) {
      logger.d(error);
      _medicalRecordBudgets = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update MEDICAL_RECORD_BUDGETS
  Future<void> updateMedicalRecordBudgets(
    String id,
    MedicalRecordBudgetRequest medicalRecordBudgetRequest,
  ) async {
    _medicalRecordBudgets = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .putMedicalRecordBudget(id, medicalRecordBudgetRequest)
        .then((value) {
      // Find from list and update or add
      final index = _medicalRecordBudgets.data?.indexWhere(
            (element) => element.id == id,
          ) ??
          -1;
      if (index >= 0) {
        _medicalRecordBudgets.data?[index] = value;
      } else {
        _medicalRecordBudgets.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
      _medicalRecordBudgets = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

//GET_MEDICAL_RECORD_COMPANIONS
  AsyncData<List<MedicalRecordCompanion>> _medicalRecordCompanions =
      const AsyncData();
  AsyncData<List<MedicalRecordCompanion>> get medicalRecordCompanions =>
      _medicalRecordCompanions;

  Future<void> getMedicalRecordCompanions(String medicalRecordId) async {
    _medicalRecordCompanions = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .medicalRecordCompanionsByMedicalRecord(medicalRecordId)
        .then((value) {
      _medicalRecordCompanions = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _medicalRecordCompanions = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // post MEDICAL_RECORD_COMPANIONS
  Future<void> postMedicalRecordCompanions(
    MedicalRecordCompanionRequest medicalRecordCompanionRequest,
  ) async {
    _medicalRecordCompanions = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .postMedicalRecordCompanion(medicalRecordCompanionRequest)
        .then((value) {
      _medicalRecordCompanions.data?.add(value);
    }).catchError((error) {
      logger.d(error);
      _medicalRecordCompanions = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update MEDICAL_RECORD_COMPANIONS
  Future<void> updateMedicalRecordCompanions(
    String id,
    MedicalRecordCompanionRequest medicalRecordCompanionRequest,
  ) async {
    _medicalRecordCompanions = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .putMedicalRecordCompanion(id, medicalRecordCompanionRequest)
        .then((value) {
      // Find from list and update or add
      final index = _medicalRecordCompanions.data?.indexWhere(
            (element) => element.id == id,
          ) ??
          -1;
      if (index >= 0) {
        _medicalRecordCompanions.data?[index] = value;
      } else {
        _medicalRecordCompanions.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
      _medicalRecordCompanions = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

//GET_MEDICAL_RECORD_HOSPITALS
  AsyncData<List<MedicalRecordHospital>> _medicalRecordHospitals =
      const AsyncData();
  AsyncData<List<MedicalRecordHospital>> get medicalRecordHospitals =>
      _medicalRecordHospitals;

  Future<void> getMedicalRecordHospitals({
    required String medicalRecordId,
    required FormGroup formGroup,
  }) async {
    _medicalRecordHospitals = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .medicalRecordHospitalsByMedicalRecord(medicalRecordId)
        .then((value) {
      _medicalRecordHospitals = AsyncData(data: value);
      insertMedicalRecordHospitals(
        data: value,
        formArray: formGroup.control('MEDICAL_RECORD_HOSPITALS') as FormArray,
      );
    }).catchError((error) {
      logger.d(error);
      _medicalRecordHospitals = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  void insertMedicalRecordHospitals({
    required List<MedicalRecordHospital> data,
    required FormArray formArray,
  }) {
    if (data.isNotEmpty) {
      formArray.clear();
      for (var element in data) {
        formArray.add(
          FormGroup({
            'id': FormControl<String?>(value: element.id),
            'hospitalName': FormControl<String>(value: element.hospitalName),
            'medicalCardNumber':
                FormControl<String>(value: element.medicalCardNumber),
          }),
        );
      }
    }
  }

  void createUpdateMedicalRecordHospital({
    required FormGroup formGroup,
    String? id,
  }) async {
    MedicalRecordHospitalRequest request = MedicalRecordHospitalRequest(
      medicalRecord: _medicalRecord.data!.id,
      medicalCardNumber: formGroup.control('medicalCardNumber').value,
      hospitalName: formGroup.control('hospitalName').value,
    );
    logger.d(request);
    if (id != null) {
      await updateMedicalRecordHospitals(id, request);
    } else {
      await postMedicalRecordHospitals(request);
    }
  }

  // post MEDICAL_RECORD_HOSPITALS
  Future<void> postMedicalRecordHospitals(
    MedicalRecordHospitalRequest medicalRecordHospitalRequest,
  ) async {
    _medicalRecordHospitals = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .postMedicalRecordHospital(medicalRecordHospitalRequest)
        .then((value) {
      if (_medicalRecordHospitals.data == null) {
        _medicalRecordHospitals = AsyncData(data: [value]);
      } else {
        _medicalRecordHospitals.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
      _medicalRecordHospitals = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update MEDICAL_RECORD_HOSPITALS
  Future<void> updateMedicalRecordHospitals(
    String id,
    MedicalRecordHospitalRequest medicalRecordHospitalRequest,
  ) async {
    _medicalRecordHospitals = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .putMedicalRecordHospital(id, medicalRecordHospitalRequest)
        .then((value) {
      // Find from list and update or add
      final index = _medicalRecordHospitals.data?.indexWhere(
            (element) => element.id == id,
          ) ??
          -1;
      if (index >= 0) {
        _medicalRecordHospitals.data?[index] = value;
      } else {
        _medicalRecordHospitals = AsyncData(data: [value]);
      }
    }).catchError((error) {
      logger.d(error);
      _medicalRecordHospitals = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

//GET_MEDICAL_RECORD_INTERPRETERS
  AsyncData<List<MedicalRecordInterpreter>> _medicalRecordInterpreters =
      const AsyncData();
  AsyncData<List<MedicalRecordInterpreter>> get medicalRecordInterpreters =>
      _medicalRecordInterpreters;

  Future<void> getMedicalRecordInterpreters(String medicalRecordId) async {
    _medicalRecordInterpreters = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .medicalRecordInterpretersByMedicalRecord(medicalRecordId)
        .then((value) {
      _medicalRecordInterpreters = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _medicalRecordInterpreters = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // post MEDICAL_RECORD_INTERPRETERS
  Future<void> postMedicalRecordInterpreters(
    MedicalRecordInterpreterRequest medicalRecordInterpreterRequest,
  ) async {
    _medicalRecordInterpreters = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .postMedicalRecordInterpreter(medicalRecordInterpreterRequest)
        .then((value) {
      _medicalRecordInterpreters.data?.add(value);
    }).catchError((error) {
      logger.d(error);
      _medicalRecordInterpreters = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update MEDICAL_RECORD_INTERPRETERS
  Future<void> updateMedicalRecordInterpreters(
    String id,
    MedicalRecordInterpreterRequest medicalRecordInterpreterRequest,
  ) async {
    _medicalRecordInterpreters = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .putMedicalRecordInterpreter(id, medicalRecordInterpreterRequest)
        .then((value) {
      // Find from list and update or add
      final index = _medicalRecordInterpreters.data?.indexWhere(
            (element) => element.id == id,
          ) ??
          -1;
      if (index >= 0) {
        _medicalRecordInterpreters.data?[index] = value;
      } else {
        _medicalRecordInterpreters.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
      _medicalRecordInterpreters = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }
}
