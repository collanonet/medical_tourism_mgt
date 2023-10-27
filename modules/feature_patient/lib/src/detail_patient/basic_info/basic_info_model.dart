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

  bool _loading = false;
  bool get loading => _loading;

  Future<void> initialData({
    Patient? patient,
    String? id,
    required FormGroup formGroup,
  }) async {
    _loading = true;
    notifyListeners();

    if (patient != null) {
      try {
        _patient = patient;
        await getPatientNames(patientId: patient.id, formGroup: formGroup);
        await getPatientNationalities(
            patientId: patient.id, formGroup: formGroup);
        await getPatientPassports(patientId: patient.id, formGroup: formGroup);
        await getMedicalRecords(patientId: patient.id, formGroup: formGroup);
      } catch (error) {
        logger.d(error);
      } finally {
        _loading = false;
        notifyListeners();
      }
    }
  }

  // Create or Update all
  Future<void> createUpdateAll(FormGroup form) async {
    _loading = true;
    notifyListeners();

    try {
      // await createUpdatePatient(form);
      await createUpdatePatientNames(form);
      await createUpdatePatientNationalities(
          form.control('PATIENT_NATIONALITIES') as FormGroup);
      await createUpdatePatientPassports(
          form.control('PATIENT_PASSPORTS') as FormGroup);
      await createUpdateMedicalRecords(form);
      await createUpdateMedicalRecordAgents(
          form.control('MEDICAL_RECORD_AGENTS') as FormGroup);
      await createUpdateMedicalRecordReferrers(
          form.control('MEDICAL_RECORD_Referrers') as FormGroup);
      await createUpdateMedicalRecordBudgets(
          form.control('MEDICAL_RECORD_BUDGETS') as FormGroup);
      await createUpdateMedicalRecordCompanions(form);
      await createUpdateMedicalRecordHospital(form);
      await createUpdateMedicalRecordInterpreters(
          form.control('MEDICAL_RECORD_Interpreter') as FormGroup);
      _loading = false;
    } catch (error) {
      logger.d(error);
    } finally {
      notifyListeners();
    }
  }

  //GET_PATIENT_NAMES
  AsyncData<List<PatientName>> _patientNames = const AsyncData();
  AsyncData<List<PatientName>> get patientNames => _patientNames;

  Future<void> getPatientNames({
    required String patientId,
    required FormGroup formGroup,
  }) async {
    _patientNames = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository.patientNamesByPatient(patientId).then((value) {
      _patientNames = AsyncData(data: value);
      insertPatientName(
        data: value,
        formArray: formGroup.control('PATIENT_NAMES') as FormArray,
      );
    }).catchError((error) {
      logger.d(error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  void insertPatientName({
    required List<PatientName> data,
    required FormArray formArray,
  }) {
    formArray.clear();
    // ramanized
    int index = data
        .indexWhere((element) => element.nameType == NameType.romanized.name);
    if (index != -1) {
      formArray.add(
        FormGroup({
          'id': FormControl<String?>(value: data[index].id),
          'nameType': FormControl<String?>(value: data[index].nameType),
          'familyName': FormControl<String?>(value: data[index].familyName),
          'middleName': FormControl<String?>(value: data[index].middleName),
          'firstName': FormControl<String?>(value: data[index].firstName),
        }),
      );
    } else {
      formArray.add(
        FormGroup({
          'id': FormControl<String?>(),
          'nameType': FormControl<String?>(value: NameType.romanized.name),
          'familyName': FormControl<String?>(),
          'middleName': FormControl<String?>(),
          'firstName': FormControl<String?>(),
        }),
      );
    }

    // chineseOrVietnamese
    index = data.indexWhere(
        (element) => element.nameType == NameType.chineseOrVietnamese.name);
    if (index != -1) {
      formArray.add(
        FormGroup({
          'id': FormControl<String?>(value: data[index].id),
          'nameType': FormControl<String?>(value: data[index].nameType),
          'familyName': FormControl<String?>(value: data[index].familyName),
          'middleName': FormControl<String?>(value: data[index].middleName),
          'firstName': FormControl<String?>(value: data[index].firstName),
        }),
      );
    } else {
      formArray.add(
        FormGroup({
          'id': FormControl<String?>(),
          'nameType':
              FormControl<String?>(value: NameType.chineseOrVietnamese.name),
          'familyName': FormControl<String?>(),
          'middleName': FormControl<String?>(),
          'firstName': FormControl<String?>(),
        }),
      );
    }

    // japaneseForChinese
    index = data.indexWhere(
        (element) => element.nameType == NameType.japaneseForChinese.name);
    if (index != -1) {
      formArray.add(
        FormGroup({
          'id': FormControl<String?>(value: data[index].id),
          'nameType': FormControl<String?>(value: data[index].nameType),
          'familyName': FormControl<String?>(value: data[index].familyName),
          'middleName': FormControl<String?>(value: data[index].middleName),
          'firstName': FormControl<String?>(value: data[index].firstName),
        }),
      );
    } else {
      formArray.add(
        FormGroup({
          'id': FormControl<String?>(),
          'nameType':
              FormControl<String?>(value: NameType.japaneseForChinese.name),
          'familyName': FormControl<String?>(),
          'middleName': FormControl<String?>(),
          'firstName': FormControl<String?>(),
        }),
      );
    }

    // japaneseForNonChinese
    index = data.indexWhere(
        (element) => element.nameType == NameType.japaneseForNonChinese.name);
    if (index != -1) {
      formArray.add(
        FormGroup({
          'id': FormControl<String?>(value: data[index].id),
          'nameType': FormControl<String?>(value: data[index].nameType),
          'familyName': FormControl<String?>(value: data[index].familyName),
          'middleName': FormControl<String?>(value: data[index].middleName),
          'firstName': FormControl<String?>(value: data[index].firstName),
        }),
      );
    } else {
      formArray.add(
        FormGroup({
          'id': FormControl<String?>(),
          'nameType':
              FormControl<String?>(value: NameType.japaneseForNonChinese.name),
          'familyName': FormControl<String?>(),
          'middleName': FormControl<String?>(),
          'firstName': FormControl<String?>(),
        }),
      );
    }
  }

  Future<void> createUpdatePatientNames(FormGroup form) async {
    await form.control('PATIENT_NAMES').value.forEach(
      (element) async {
        logger.d(element);
        PatientNameRequest request = PatientNameRequest(
          familyName: element['familyName'],
          middleName: element['middleName'],
          firstName: element['firstName'],
          nameType: element['nameType'],
          patient: _patient.id,
        );

        if (element['id'] != null) {
          if (element['familyName'].isEmpty && element['firstName'].isEmpty) {
            await deletePatientNames(
              id: element['id'],
              formGroup: form,
            );
          } else {
            await updatePatientNames(element['id'], request);
          }
        } else {
          if (element['familyName'] != null && element['firstName'] != null) {
            await postPatientNames(request);
          }
        }
      },
    );
  }

  // post PATIENT_NAMES
  Future<void> postPatientNames(
    PatientNameRequest patientNameRequest,
  ) async {
    await patientRepository.postPatientName(patientNameRequest).then((value) {
      if (_patientNames.data == null) {
        _patientNames = AsyncData(data: [value]);
      } else {
        _patientNames.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update PATIENT_NAMES
  Future<void> updatePatientNames(
    String id,
    PatientNameRequest patientNameRequest,
  ) async {
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
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // delete PATIENT_NAMES
  Future<void> deletePatientNames({
    required String id,
    required FormGroup formGroup,
  }) async {
    await patientRepository.deletePatientName(id).then((value) async {
      // Find from list and update or add
      await getPatientNames(patientId: _patient.id, formGroup: formGroup);
    }).catchError((error) {
      logger.d(error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

//GET_PATIENT_NATIONALITIES
  AsyncData<PatientNationality> _patientNationalities = const AsyncData();
  AsyncData<PatientNationality> get patientNationalities =>
      _patientNationalities;

  Future<void> getPatientNationalities({
    required String patientId,
    required FormGroup formGroup,
  }) async {
    _patientNationalities = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .patientNationalitiesByPatient(patientId)
        .then((value) {
      _patientNationalities = AsyncData(data: value.first);
      insertPATIENTNATIONALITIES(
          data: value.first,
          formGroup: formGroup.control('PATIENT_NATIONALITIES') as FormGroup);
    }).catchError((error) {
      logger.d(error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  void insertPATIENTNATIONALITIES({
    required PatientNationality data,
    required FormGroup formGroup,
  }) {
    formGroup.control('id').value = data.id;
    formGroup.control('nationality').value = data.nationality;
    formGroup.control('nativeLanguage').value = data.nativeLanguage;
    formGroup.control('residentialArea').value = data.residentialArea;
    formGroup.control('currentAddress').value = data.currentAddress;
    formGroup.control('mobileNumber').value = data.mobileNumber;
    formGroup.control('patient').value = data.patient;
  }

  // post PATIENT_NATIONALITIES
  Future<void> postPatientNationalities(
    PatientNationalityRequest patientNationalityRequest,
  ) async {
    await patientRepository
        .postPatientNationality(patientNationalityRequest)
        .then((value) {
      _patientNationalities = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
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
      _patientNationalities = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

//GET_PATIENT_PASSPORTS
  AsyncData<PatientPassport> _patientPassport = const AsyncData();
  AsyncData<PatientPassport> get patientPassport => _patientPassport;

  Future<void> getPatientPassports({
    required String patientId,
    required FormGroup formGroup,
  }) async {
    _patientPassport = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository.patientPassportsByPatient(patientId).then((value) {
      _patientPassport = AsyncData(data: value.first);
      insertPATIENTPASSPORTS(
          data: value.first,
          formGroup: formGroup.control('PATIENT_PASSPORTS') as FormGroup);
    }).catchError((error) {
      logger.d(error);
      _patientPassport = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  void insertPATIENTPASSPORTS({
    PatientPassport? data,
    required FormGroup formGroup,
  }) {
    formGroup.control('id').value = data?.id;
    formGroup.control('passportNumber').value = data?.passportNumber;
    formGroup.control('issueDate').value = data?.issueDate;
    formGroup.control('expirationDate').value = data?.expirationDate;
    formGroup.control('visaType').value = data?.visaType ?? 'medicalGuarantee';
    formGroup.control('visaCategory').value = data?.visaCategory;
    formGroup.control('underConfirmation').value =
        data?.underConfirmation ?? false;
  }

  // post PATIENT_PASSPORTS
  Future<void> postPatientPassports(
    PatientPassportRequest patientPassportRequest,
  ) async {
    await patientRepository
        .postPatientPassport(patientPassportRequest)
        .then((value) {
      _patientPassport = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update PATIENT_PASSPORTS
  Future<void> updatePatientPassports(
    String id,
    PatientPassportRequest patientPassportRequest,
  ) async {
    await patientRepository
        .putPatientPassport(id, patientPassportRequest)
        .then((value) {
      _patientPassport = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
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
      await getMedicalRecordAgents(
        medicalRecordId: _medicalRecord.data!.id,
        formGroup: formGroup,
      );
      await getMedicalRecordReferrers(
        medicalRecordId: _medicalRecord.data!.id,
        formGroup: formGroup,
      );
      await getMedicalRecordBudgets(
        medicalRecordId: _medicalRecord.data!.id,
        formGroup: formGroup,
      );
      await getMedicalRecordCompanions(
        medicalRecordId: _medicalRecord.data!.id,
        formGroup: formGroup,
      );
      await getMedicalRecordHospitals(
        medicalRecordId: _medicalRecord.data!.id,
        formGroup: formGroup,
      );
      await getMedicalRecordInterpreters(
        medicalRecordId: _medicalRecord.data!.id,
        formGroup: formGroup,
      );
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
    await patientRepository
        .postMedicalRecord(medicalRecordRequest)
        .then((value) {
      _medicalRecord = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update MEDICAL_RECORDS
  Future<void> updateMedicalRecords(
    String id,
    MedicalRecordRequest medicalRecordRequest,
  ) async {
    await patientRepository
        .putMedicalRecord(id, medicalRecordRequest)
        .then((value) {
      _medicalRecord = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

//GET_MEDICAL_RECORD_AGENTS
  AsyncData<List<MedicalRecordAgent>> _medicalRecordAgents = const AsyncData();
  AsyncData<List<MedicalRecordAgent>> get medicalRecordAgents =>
      _medicalRecordAgents;

  Future<void> getMedicalRecordAgents({
    required String medicalRecordId,
    required FormGroup formGroup,
  }) async {
    _medicalRecordAgents = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .medicalRecordAgentsByMedicalRecord(medicalRecordId)
        .then((value) {
      _medicalRecordAgents = AsyncData(data: value);
      insertMEDICALRECORDAGENTS(
        data: value.first,
        formGroup: formGroup.control('MEDICAL_RECORD_AGENTS') as FormGroup,
      );
    }).catchError((error) {
      logger.d(error);
      _medicalRecordAgents = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  void insertMEDICALRECORDAGENTS({
    required MedicalRecordAgent data,
    required FormGroup formGroup,
  }) {
    formGroup.control('id').value = data.id;
    formGroup.control('company').value = data.company;
    formGroup.control('nameInKanji').value = data.nameInKanji;
    formGroup.control('nameInKana').value = data.nameInKana;
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
      if (_medicalRecordAgents.data == null) {
        _medicalRecordAgents = AsyncData(data: [value]);
      } else {
        _medicalRecordAgents.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update MEDICAL_RECORD_AGENTS
  Future<void> updateMedicalRecordAgents(
    String id,
    MedicalRecordAgentRequest medicalRecordAgentRequest,
  ) async {
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
    }).whenComplete(() {
      notifyListeners();
    });
  }

  //GET_MEDICAL_RECORD_BUDGETS
  AsyncData<List<MedicalRecordReferrer>> _medicalRecordReferrers =
      const AsyncData();
  AsyncData<List<MedicalRecordReferrer>> get medicalRecordReferrers =>
      _medicalRecordReferrers;

  Future<void> getMedicalRecordReferrers({
    required String medicalRecordId,
    required FormGroup formGroup,
  }) async {
    _medicalRecordReferrers = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .medicalRecordReferrersByMedicalRecord(medicalRecordId)
        .then((value) {
      _medicalRecordReferrers = AsyncData(data: value);
      insertMEDICALRECORDReferrers(
        data: value.first,
        formGroup: formGroup.control('MEDICAL_RECORD_Referrers') as FormGroup,
      );
    }).catchError((error) {
      logger.d(error);
      _medicalRecordReferrers = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  void insertMEDICALRECORDReferrers({
    required MedicalRecordReferrer data,
    required FormGroup formGroup,
  }) {
    formGroup.control('id').value = data.id;
    formGroup.control('company').value = data.company;
    formGroup.control('nameInKanji').value = data.nameInKanji;
    formGroup.control('nameInKana').value = data.nameInKana;
  }

  // post MEDICAL_RECORD_Referrers
  Future<void> postMedicalRecordReferrers(
    MedicalRecordReferrerRequest medicalRecordAgentRequest,
  ) async {
    _medicalRecordReferrers = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .postMedicalRecordReferrer(medicalRecordAgentRequest)
        .then((value) {
      if (_medicalRecordReferrers.data == null) {
        _medicalRecordReferrers = AsyncData(data: [value]);
      } else {
        _medicalRecordReferrers.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update MEDICAL_RECORD_Referrers
  Future<void> updateMedicalRecordReferrers(
    String id,
    MedicalRecordReferrerRequest medicalRecordAgentRequest,
  ) async {
    await patientRepository
        .putMedicalRecordReferrer(id, medicalRecordAgentRequest)
        .then((value) {
      // Find from list and update or add
      final index = _medicalRecordReferrers.data?.indexWhere(
            (element) => element.id == id,
          ) ??
          -1;
      if (index >= 0) {
        _medicalRecordReferrers.data?[index] = value;
      } else {
        _medicalRecordReferrers.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

// GET_MEDICAL_RECORD_BUDGETS
  AsyncData<List<MedicalRecordBudget>> _medicalRecordBudgets =
      const AsyncData();
  AsyncData<List<MedicalRecordBudget>> get medicalRecordBudgets =>
      _medicalRecordBudgets;

  Future<void> getMedicalRecordBudgets({
    required String medicalRecordId,
    required FormGroup formGroup,
  }) async {
    _medicalRecordBudgets = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .medicalRecordBudgetsByMedicalRecord(medicalRecordId)
        .then((value) {
      _medicalRecordBudgets = AsyncData(data: value);
      insertMEDICALRECORDBUDGETS(
        data: value.first,
        formGroup: formGroup.control('MEDICAL_RECORD_BUDGETS') as FormGroup,
      );
    }).catchError((error) {
      logger.d(error);
      _medicalRecordBudgets = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  void insertMEDICALRECORDBUDGETS({
    required MedicalRecordBudget data,
    required FormGroup formGroup,
  }) {
    formGroup.control('id').value = data.id;
    formGroup.control('budget').value = data.budget.toString();
    formGroup.control('remarks').value = data.remarks;
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
      if (_medicalRecordBudgets.data == null) {
        _medicalRecordBudgets = AsyncData(data: [value]);
      } else {
        _medicalRecordBudgets.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update MEDICAL_RECORD_BUDGETS
  Future<void> updateMedicalRecordBudgets(
    String id,
    MedicalRecordBudgetRequest medicalRecordBudgetRequest,
  ) async {
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
    }).whenComplete(() {
      notifyListeners();
    });
  }

//GET_MEDICAL_RECORD_COMPANIONS
  AsyncData<List<MedicalRecordCompanion>> _medicalRecordCompanions =
      const AsyncData();
  AsyncData<List<MedicalRecordCompanion>> get medicalRecordCompanions =>
      _medicalRecordCompanions;

  Future<void> getMedicalRecordCompanions({
    required String medicalRecordId,
    required FormGroup formGroup,
  }) async {
    _medicalRecordCompanions = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .medicalRecordCompanionsByMedicalRecord(medicalRecordId)
        .then((value) {
      _medicalRecordCompanions = AsyncData(data: value);
      insertMEDICALRECORDCOMPANIONS(
        data: value,
        formArray: formGroup.control('MEDICAL_RECORD_Companion') as FormArray,
      );
    }).catchError((error) {
      logger.d(error);
      _medicalRecordCompanions = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  void insertMEDICALRECORDCOMPANIONS({
    required List<MedicalRecordCompanion> data,
    required FormArray formArray,
  }) {
    try {
      logger.d(data.length);
      if (data.isNotEmpty) {
        formArray.clear();
        for (var element in data) {
          logger.d(element.toJson());
          formArray.add(
            FormGroup({
              'id': FormControl<String?>(value: element.id),
              'leader': FormControl<bool>(value: element.leader),
              'remarks': FormControl<String?>(value: element.remarks ?? ''),
              'nameInRomanized':
                  FormControl<String?>(value: element.nameInRomanized),
              'nameInChineseOrKanji':
                  FormControl<String?>(value: element.nameInChineseOrKanji),
              'nameInJapaneseKanji':
                  FormControl<String?>(value: element.nameInJapaneseKanji),
              'nameInKana': FormControl<String?>(value: element.nameInKana),
              'nationality': FormControl<String?>(value: element.nationality),
              'relationship': FormControl<String>(value: element.relationship),
              'dateOfBirth': FormControl<DateTime>(value: element.dateOfBirth),
              'age': FormControl<int?>(value: element.age ?? 0),
              'gender': FormControl<String>(value: 'male'),
              'passportNumber':
                  FormControl<String?>(value: element.passportNumber),
              'issueDate': FormControl<DateTime>(value: element.issueDate),
              'expirationDate':
                  FormControl<DateTime>(value: element.expirationDate),
              'visaType': FormControl<String>(value: element.visaType),
            }),
          );
        }
      }
    } catch (e) {
      logger.d(e);
    }
  }

  // post MEDICAL_RECORD_COMPANIONS
  Future<void> postMedicalRecordCompanions(
    MedicalRecordCompanionRequest medicalRecordCompanionRequest,
  ) async {
    await patientRepository
        .postMedicalRecordCompanion(medicalRecordCompanionRequest)
        .then((value) {
      if (_medicalRecordCompanions.data == null) {
        _medicalRecordCompanions = AsyncData(data: [value]);
      } else {
        _medicalRecordCompanions.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update MEDICAL_RECORD_COMPANIONS
  Future<void> updateMedicalRecordCompanions(
    String id,
    MedicalRecordCompanionRequest medicalRecordCompanionRequest,
  ) async {
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
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // delete deleteMedicalRecordCompanions

  Future<void> deleteMedicalRecordCompanions(
    String id,
  ) async {
    await patientRepository.deleteMedicalRecordCompanion(id).then((value) {
      // Find from list and update or add
      final index = _medicalRecordCompanions.data?.indexWhere(
            (element) => element.id == id,
          ) ??
          -1;
      if (index >= 0) {
        _medicalRecordCompanions.data?.removeAt(index);
      }
    }).catchError((error) {
      logger.d(error);
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

  Future<void> createUpdateMedicalRecordHospital(FormGroup formGroup) async {
    await formGroup.control('MEDICAL_RECORD_HOSPITALS').value.forEach(
      (element) async {
        MedicalRecordHospitalRequest request = MedicalRecordHospitalRequest(
          medicalCardNumber: element['medicalCardNumber'],
          hospitalName: element['hospitalName'],
          medicalRecord: _medicalRecord.data?.id,
        );

        if (element['id'] != null) {
          if (element['hospitalName'].isEmpty &&
              element['medicalCardNumber'].isEmpty) {
            await deleteMedicalRecordHospitals(element['id']);
          } else {
            await updateMedicalRecordHospitals(element['id'], request);
          }
        } else {
          if (element['hospitalName'] != null &&
              element['medicalCardNumber'] != null) {
            await postMedicalRecordHospitals(request);
          }
        }
      },
    );
  }

  // post MEDICAL_RECORD_HOSPITALS
  Future<void> postMedicalRecordHospitals(
    MedicalRecordHospitalRequest medicalRecordHospitalRequest,
  ) async {
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
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update MEDICAL_RECORD_HOSPITALS
  Future<void> updateMedicalRecordHospitals(
    String id,
    MedicalRecordHospitalRequest medicalRecordHospitalRequest,
  ) async {
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
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // delete MEDICAL_RECORD_HOSPITALS
  Future<void> deleteMedicalRecordHospitals(
    String id,
  ) async {
    await patientRepository.deleteMedicalRecordHospital(id).then((value) {
      // Find from list and update or add
      final index = _medicalRecordHospitals.data?.indexWhere(
            (element) => element.id == id,
          ) ??
          -1;
      if (index >= 0) {
        _medicalRecordHospitals.data?.removeAt(index);
      }
    }).catchError((error) {
      logger.d(error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

//GET_MEDICAL_RECORD_INTERPRETERS
  AsyncData<List<MedicalRecordInterpreter>> _medicalRecordInterpreters =
      const AsyncData();
  AsyncData<List<MedicalRecordInterpreter>> get medicalRecordInterpreters =>
      _medicalRecordInterpreters;

  Future<void> getMedicalRecordInterpreters({
    required String medicalRecordId,
    required FormGroup formGroup,
  }) async {
    _medicalRecordInterpreters = const AsyncData(loading: true);
    notifyListeners();

    await patientRepository
        .medicalRecordInterpretersByMedicalRecord(medicalRecordId)
        .then((value) {
      _medicalRecordInterpreters = AsyncData(data: value);
      insertMedicalRecordInterpreters(
        data: value.first,
        formGroup: formGroup.control('MEDICAL_RECORD_Interpreter') as FormGroup,
      );
    }).catchError((error) {
      logger.d(error);
      _medicalRecordInterpreters = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  void insertMedicalRecordInterpreters({
    required MedicalRecordInterpreter data,
    required FormGroup formGroup,
  }) {
    formGroup.control('id').value = data.id;
    formGroup.control('requiredOrUnnnecessary').value =
        data.requiredOrUnnnecessary ? '要' : '不要';
    formGroup.control('interpreter').value = data.interpreter;
  }

  // post MEDICAL_RECORD_INTERPRETERS
  Future<void> postMedicalRecordInterpreters(
    MedicalRecordInterpreterRequest medicalRecordInterpreterRequest,
  ) async {
    await patientRepository
        .postMedicalRecordInterpreter(medicalRecordInterpreterRequest)
        .then((value) {
      if (_medicalRecordInterpreters.data == null) {
        _medicalRecordInterpreters = AsyncData(data: [value]);
      } else {
        _medicalRecordInterpreters.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
    }).whenComplete(() {
      notifyListeners();
    });
  }

  // update MEDICAL_RECORD_INTERPRETERS
  Future<void> updateMedicalRecordInterpreters(
    String id,
    MedicalRecordInterpreterRequest medicalRecordInterpreterRequest,
  ) async {
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
    }).whenComplete(() {
      notifyListeners();
    });
  }

  Future<void> createUpdatePatientNationalities(FormGroup form) async {
    PatientNationalityRequest request = PatientNationalityRequest(
      nationality: form.control('nationality').value,
      nativeLanguage: form.control('nativeLanguage').value,
      residentialArea: form.control('residentialArea').value,
      currentAddress: form.control('currentAddress').value,
      mobileNumber: form.control('mobileNumber').value,
      patient: _patient.id,
    );

    if (form.control('id').value != null) {
      await updatePatientNationalities(form.control('id').value, request);
    } else {
      await postPatientNationalities(request);
    }
  }

  Future<void> createUpdateMedicalRecordBudgets(FormGroup form) async {
    MedicalRecordBudgetRequest request = MedicalRecordBudgetRequest(
      budget: double.tryParse(form.control('budget').value) ?? 0.0,
      remarks: form.control('remarks').value,
      medicalRecord: _medicalRecord.data?.id,
    );

    if (form.control('id').value != null) {
      await updateMedicalRecordBudgets(form.control('id').value, request);
    } else {
      await postMedicalRecordBudgets(request);
    }
  }

  Future<void> createUpdateMedicalRecordAgents(FormGroup form) async {
    MedicalRecordAgentRequest request = MedicalRecordAgentRequest(
      company: form.control('company').value,
      nameInKanji: form.control('nameInKanji').value,
      nameInKana: form.control('nameInKana').value,
      medicalRecord: _medicalRecord.data?.id,
    );

    if (form.control('id').value != null) {
      await updateMedicalRecordAgents(form.control('id').value, request);
    } else {
      await postMedicalRecordAgents(request);
    }
  }

  Future<void> createUpdateMedicalRecordReferrers(FormGroup form) async {
    MedicalRecordReferrerRequest request = MedicalRecordReferrerRequest(
      company: form.control('company').value,
      nameInKanji: form.control('nameInKanji').value,
      nameInKana: form.control('nameInKana').value,
      medicalRecord: _medicalRecord.data?.id,
    );

    if (form.control('id').value != null) {
      await updateMedicalRecordReferrers(form.control('id').value, request);
    } else {
      await postMedicalRecordReferrers(request);
    }
  }

  Future<void> createUpdateMedicalRecordInterpreters(FormGroup control) async {
    MedicalRecordInterpreterRequest request = MedicalRecordInterpreterRequest(
      requiredOrUnnnecessary:
          control.control('requiredOrUnnnecessary').value == '要' ? true : false,
      interpreter: control.control('interpreter').value,
      medicalRecord: _medicalRecord.data?.id,
    );

    if (control.control('id').value != null) {
      await updateMedicalRecordInterpreters(
          control.control('id').value, request);
    } else {
      await postMedicalRecordInterpreters(request);
    }
  }

  Future<void> createUpdatePatientPassports(FormGroup form) async {
    PatientPassportRequest request = PatientPassportRequest(
      passportNumber: form.control('passportNumber').value,
      issueDate: form.control('issueDate').value,
      expirationDate: form.control('expirationDate').value,
      visaType: form.control('visaType').value,
      visaCategory: form.control('visaCategory').value,
      underConfirmation: form.control('underConfirmation').value,
      patient: _patient.id,
    );

    if (form.control('id').value != null) {
      await updatePatientPassports(form.control('id').value, request);
    } else {
      await postPatientPassports(request);
    }
  }

  Future<void> createUpdateMedicalRecordCompanions(FormGroup form) async {
    await form
        .control('MEDICAL_RECORD_Companion')
        .value
        .forEach((element) async {
      MedicalRecordCompanionRequest request = MedicalRecordCompanionRequest(
        leader: element['leader'],
        remarks: element['remarks'],
        nameInRomanized: element['nameInRomanized'],
        nameInChineseOrKanji: element['nameInChineseOrKanji'],
        nameInJapaneseKanji: element['nameInJapaneseKanji'],
        nameInKana: element['nameInKana'],
        nationality: element['nationality'],
        relationship: element['relationship'],
        dateOfBirth: element['dateOfBirth'],
        age:
            ageCalculator(DateTime.tryParse(element['dateOfBirth'].toString())),
        gender: element['gender'],
        passportNumber: element['passportNumber'],
        issueDate: element['issueDate'],
        expirationDate: element['expirationDate'],
        visaType: element['visaType'],
        medicalRecord: _medicalRecord.data?.id,
      );

      if (element['id'] != null) {
        if (element['nameInRomanized'] != null &&
            element['nameInRomanized'] != '' &&
            element['passportNumber'] != null &&
            element['passportNumber'] != '') {
          await updateMedicalRecordCompanions(element['id'], request);
        } else {
          await deleteMedicalRecordCompanions(element['id']);
        }
      } else {
        if (element['nameInRomanized'] != null &&
            element['nameInRomanized'] != '' &&
            element['dateOfBirth'] != null &&
            element['dateOfBirth'] != '' &&
            element['passportNumber'] != null &&
            element['passportNumber'] != '' &&
            element['issueDate'] != null &&
            element['issueDate'] != '' &&
            element['expirationDate'] != null &&
            element['expirationDate'] != '') {
          await postMedicalRecordCompanions(request);
        }
      }
    });
  }
}
