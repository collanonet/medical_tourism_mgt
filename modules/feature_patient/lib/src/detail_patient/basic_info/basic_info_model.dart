import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class BasicInformationModel {
  BasicInformationModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<Patient>> patientData =
      ValueNotifier<AsyncData<Patient>>(const AsyncData());

  ValueNotifier<AsyncData> loading =
      ValueNotifier<AsyncData>(const AsyncData());

  Future<void> initialData({
    Patient? patient,
    String? id,
    required FormGroup formGroup,
  }) async {
    loading.value = const AsyncData(loading: true);

    if (patient != null) {
      try {
        patientData.value = AsyncData(data: patient);
        await getPatientNames(patientId: patient.id, formGroup: formGroup);
        // await getPatientNationalities(
        //     patientId: patient.id, formGroup: formGroup);
        // await getPatientPassports(patientId: patient.id, formGroup: formGroup);
        await getMedicalRecords(patientId: patient.id, formGroup: formGroup);
        loading.value = const AsyncData();
      } catch (error) {
        logger.d(error);
        loading.value = AsyncData(error: error);
      }
    }
  }

  // Create or Update all
  void createUpdateAll(FormGroup form) async {
    try {
      loading.value = const AsyncData(loading: true);
      // await createUpdatePatient(form);

      // await createUpdatePatientNationalities(
      //     form.control('PATIENT_NATIONALITIES') as FormGroup);
      // await createUpdatePatientPassports(
      //     form.control('PATIENT_PASSPORTS') as FormGroup);
      await createUpdateMedicalRecords(form);
      await createUpdateMedicalRecordHospital(form);
      await createUpdatePatientNames(form.control('PATIENT_NAMES') as FormGroup);
      // await createUpdateMedicalRecordAgents(
      //     form.control('MEDICAL_RECORD_AGENTS') as FormGroup);
      // await createUpdateMedicalRecordReferrers(
      //     form.control('MEDICAL_RECORD_Referrers') as FormGroup);
      // await createUpdateMedicalRecordBudgets(
      //     form.control('MEDICAL_RECORD_BUDGETS') as FormGroup);
      // await createUpdateMedicalRecordCompanions(form);

      // await createUpdateMedicalRecordInterpreters(
      //     form.control('MEDICAL_RECORD_Interpreter') as FormGroup);
      logger.d('createUpdateAll');
      loading.value = const AsyncData(data: true);
    } catch (error) {
      logger.d(error);
      loading.value = AsyncData(error: error);
    }
  }

  // //GET_PATIENT_NAMES
  ValueNotifier<AsyncData<PatientName>> patientNames = ValueNotifier(
    const AsyncData(),
  );

  Future<void> getPatientNames({
    required String patientId,
    required FormGroup formGroup,
  }) async {
    patientNames.value = const AsyncData(loading: true);

    await patientRepository.patientNamesByPatient(patientId).then((value) {
      if (value.isNotEmpty) {
        patientNames.value = AsyncData(data: value.firstOrNull);
        insertPatientName(
          data: value,
          formGroup: formGroup.control('PATIENT_NAMES') as FormGroup,
        );
      } else {
        patientNames.value = const AsyncData();
      }
    }).catchError((error) {
      logger.d(error);
      patientNames.value = AsyncData(error: error);
    });
  }

  void insertPatientName({
    required List<PatientName> data,
    required FormGroup formGroup,
  }) {
    formGroup.reset();

    formGroup.control('id').value = data.first.id;
    formGroup.control('familyNameRomanized').value =
        data.first.familyNameRomanized;
    formGroup.control('middleNameRomanized').value =
        data.first.middleNameRomanized;
    formGroup.control('firstNameRomanized').value =
        data.first.firstNameRomanized;
    formGroup.control('familyNameChineseOrVietnamese').value =
        data.first.familyNameChineseOrVietnamese;
    formGroup.control('middleNameChineseOrVietnamese').value =
        data.first.middleNameChineseOrVietnamese;
    formGroup.control('firstNameChineseOrVietnamese').value =
        data.first.firstNameChineseOrVietnamese;
    formGroup.control('familyNameJapaneseForChinese').value =
        data.first.familyNameJapaneseForChinese;
    formGroup.control('middleNameJapaneseForChinese').value =
        data.first.middleNameJapaneseForChinese;
    formGroup.control('firstNameJapaneseForChinese').value =
        data.first.firstNameJapaneseForChinese;
    formGroup.control('familyNameJapaneseForNonChinese').value =
        data.first.familyNameJapaneseForNonChinese;
    formGroup.control('middleNameJapaneseForNonChinese').value =
        data.first.middleNameJapaneseForNonChinese;
    formGroup.control('firstNameJapaneseForNonChinese').value =
        data.first.firstNameJapaneseForNonChinese;
  }

  Future<void> createUpdatePatientNames(FormGroup form) async {
    try {
      patientNames.value = const AsyncData(loading: true);

      PatientNameRequest request = PatientNameRequest(
        familyNameRomanized: form.control('familyNameRomanized').value,
        middleNameRomanized: form.control('middleNameRomanized').value,
        firstNameRomanized: form.control('firstNameRomanized').value,
        familyNameChineseOrVietnamese:
            form.control('familyNameChineseOrVietnamese').value,
        middleNameChineseOrVietnamese:
            form.control('middleNameChineseOrVietnamese').value,
        firstNameChineseOrVietnamese:
            form.control('firstNameChineseOrVietnamese').value,
        familyNameJapaneseForChinese:
            form.control('familyNameJapaneseForChinese').value,
        middleNameJapaneseForChinese:
            form.control('middleNameJapaneseForChinese').value,
        firstNameJapaneseForChinese:
            form.control('firstNameJapaneseForChinese').value,
        familyNameJapaneseForNonChinese:
            form.control('familyNameJapaneseForNonChinese').value,
        middleNameJapaneseForNonChinese:
            form.control('middleNameJapaneseForNonChinese').value,
        firstNameJapaneseForNonChinese:
            form.control('firstNameJapaneseForNonChinese').value,
        patient: patientData.value.requireData.id,
      );

      if (form.control('id').value != null) {
        await updatePatientNames(form.control('id').value, request);
      } else {
        await postPatientNames(request);
      }
    } catch (error) {
      logger.d(error);
      patientNames.value = AsyncData(error: error);
    }
  }

  // post PATIENT_NAMES
  Future<void> postPatientNames(
    PatientNameRequest patientNameRequest,
  ) async {
    await patientRepository.postPatientName(patientNameRequest).then((value) {
      patientNames.value = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      patientNames.value = AsyncData(error: error);
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
      patientNames.value = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      patientNames.value = AsyncData(error: error);
    });
  }

//GET_PATIENT_NATIONALITIES
//   AsyncData<PatientNationality> _patientNationalities = const AsyncData();
//   AsyncData<PatientNationality> get patientNationalities =>
//       _patientNationalities;
//
//   Future<void> getPatientNationalities({
//     required String patientId,
//     required FormGroup formGroup,
//   }) async {
//     _patientNationalities = const AsyncData(loading: true);
//     notifyListeners();
//
//     await patientRepository
//         .patientNationalitiesByPatient(patientId)
//         .then((value) {
//       if (value.isNotEmpty) {
//         _patientNationalities = AsyncData(data: value.first);
//         insertPATIENTNATIONALITIES(
//             data: value.first,
//             formGroup: formGroup.control('PATIENT_NATIONALITIES') as FormGroup);
//       }
//     }).catchError((error) {
//       logger.d(error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
//   void insertPATIENTNATIONALITIES({
//     required PatientNationality data,
//     required FormGroup formGroup,
//   }) {
//     formGroup.control('id').value = data.id;
//     formGroup.control('nationality').value = data.nationality;
//     formGroup.control('nativeLanguage').value = data.nativeLanguage;
//     formGroup.control('residentialArea').value = data.residentialArea;
//     formGroup.control('currentAddress').value = data.currentAddress;
//     formGroup.control('mobileNumber').value = data.mobileNumber;
//     formGroup.control('patient').value = data.patient;
//   }
//
//   // post PATIENT_NATIONALITIES
//   Future<void> postPatientNationalities(
//     PatientNationalityRequest patientNationalityRequest,
//   ) async {
//     await patientRepository
//         .postPatientNationality(patientNationalityRequest)
//         .then((value) {
//       _patientNationalities = AsyncData(data: value);
//     }).catchError((error) {
//       logger.d(error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
//   // update PATIENT_NATIONALITIES
//   Future<void> updatePatientNationalities(
//     String id,
//     PatientNationalityRequest patientNationalityRequest,
//   ) async {
//     _patientNationalities = const AsyncData(loading: true);
//     notifyListeners();
//
//     await patientRepository
//         .putPatientNationality(id, patientNationalityRequest)
//         .then((value) {
//       _patientNationalities = AsyncData(data: value);
//     }).catchError((error) {
//       logger.d(error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
// //GET_PATIENT_PASSPORTS
//   AsyncData<PatientPassport> _patientPassport = const AsyncData();
//   AsyncData<PatientPassport> get patientPassport => _patientPassport;
//
//   Future<void> getPatientPassports({
//     required String patientId,
//     required FormGroup formGroup,
//   }) async {
//     _patientPassport = const AsyncData(loading: true);
//     notifyListeners();
//
//     await patientRepository.patientPassportsByPatient(patientId).then((value) {
//       if (value.isNotEmpty) {
//         _patientPassport = AsyncData(data: value.first);
//         insertPATIENTPASSPORTS(
//             data: value.first,
//             formGroup: formGroup.control('PATIENT_PASSPORTS') as FormGroup);
//       } else {
//         _patientPassport = const AsyncData();
//       }
//     }).catchError((error) {
//       logger.d(error);
//       _patientPassport = AsyncData(error: error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
//   void insertPATIENTPASSPORTS({
//     PatientPassport? data,
//     required FormGroup formGroup,
//   }) {
//     formGroup.control('id').value = data?.id;
//     formGroup.control('passportNumber').value = data?.passportNumber;
//     formGroup.control('issueDate').value = data?.issueDate;
//     formGroup.control('expirationDate').value = data?.expirationDate;
//     formGroup.control('visaType').value = data?.visaType ?? 'medicalGuarantee';
//     formGroup.control('visaCategory').value = data?.visaCategory;
//     formGroup.control('underConfirmation').value =
//         data?.underConfirmation ?? false;
//   }
//
//   // post PATIENT_PASSPORTS
//   Future<void> postPatientPassports(
//     PatientPassportRequest patientPassportRequest,
//   ) async {
//     await patientRepository
//         .postPatientPassport(patientPassportRequest)
//         .then((value) {
//       _patientPassport = AsyncData(data: value);
//     }).catchError((error) {
//       logger.d(error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
//   // update PATIENT_PASSPORTS
//   Future<void> updatePatientPassports(
//     String id,
//     PatientPassportRequest patientPassportRequest,
//   ) async {
//     await patientRepository
//         .putPatientPassport(id, patientPassportRequest)
//         .then((value) {
//       _patientPassport = AsyncData(data: value);
//     }).catchError((error) {
//       logger.d(error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }

//GET_MEDICAL_RECORDS
  ValueNotifier<AsyncData<MedicalRecord>> medicalRecord =
      ValueNotifier<AsyncData<MedicalRecord>>(const AsyncData());

  Future<void> getMedicalRecords({
    required String patientId,
    required FormGroup formGroup,
  }) async {
    medicalRecord.value = const AsyncData(loading: true);

    await patientRepository.medicalRecordsByPatient(patientId).then((value) {
      if (value.isNotEmpty) {
        medicalRecord.value = AsyncData(data: value.first);
        insertMedicalRecord(data: value.first, formGroup: formGroup);
      } else {
        medicalRecord.value = const AsyncData();
      }
    }).catchError((error) {
      logger.d(error);
      medicalRecord.value = AsyncData(error: error);
    });
    if (medicalRecord.value.data != null) {
      await getMedicalRecordHospitals(
        medicalRecordId: medicalRecord.value.requireData.id,
        formGroup: formGroup,
      );
      //   await getMedicalRecordAgents(
      //     medicalRecordId: _medicalRecord.data!.id,
      //     formGroup: formGroup,
      //   );
      //   await getMedicalRecordReferrers(
      //     medicalRecordId: _medicalRecord.data!.id,
      //     formGroup: formGroup,
      //   );
      //   await getMedicalRecordBudgets(
      //     medicalRecordId: _medicalRecord.data!.id,
      //     formGroup: formGroup,
      //   );
      //   await getMedicalRecordCompanions(
      //     medicalRecordId: _medicalRecord.data!.id,
      //     formGroup: formGroup,
      //   );

      //   await getMedicalRecordInterpreters(
      //     medicalRecordId: _medicalRecord.data!.id,
      //     formGroup: formGroup,
      //   );
    }
  }

  void insertMedicalRecord({
    MedicalRecord? data,
    required FormGroup formGroup,
  }) {
    formGroup.control('id').value = data?.id;
    formGroup.control('dateOfBirth').value = data?.dateOfBirth;
    formGroup.control('age').value = data?.age;
    formGroup.control('height').value = data?.height;
    formGroup.control('weight').value = data?.weight;
    formGroup.control('gender').value = data?.gender;
    formGroup.control('isMale').value = data?.gender;
    formGroup.control('isFemale').value = data?.gender;
    formGroup.control('arrivalDate').value = data?.arrivalDate;
    formGroup.control('consultationDate').value = data?.consultationDate;
    formGroup.control('returnDate').value = data?.returnDate;
    formGroup.control('proposalNumber').value = data?.proposalNumber;
    formGroup.control('receptionDate').value = data?.receptionDate;
    final type = formGroup.control('type') as FormArray;
    type.clear();
    data?.type?.forEach((element) {
      type.add(
        FormGroup({
          'type': FormControl<String?>(value: element),
        }),
      );
    });

    if (data?.type == null || data?.type?.isEmpty == true) {
      type.add(
        FormGroup({
          'type': FormControl<String?>(),
        }),
      );
    }

    formGroup.control('progress').value = data?.progress;
    formGroup.control('advancePaymentDate').value = data?.advancePaymentDate;
    formGroup.control('receivingMethod').value = data?.receivingMethod;
    formGroup.control('memo').value = data?.memo;
    formGroup.control('patient').value = data?.patient;
  }

  Future<void> createUpdateMedicalRecords(FormGroup form) async {
    medicalRecord.value = medicalRecord.value.copyWith(loading: true);
    try {
      MedicalRecordRequest request = MedicalRecordRequest(
        dateOfBirth: form.control('dateOfBirth').value,
        age: form.control('age').value,
        height: form.control('height').value,
        weight: form.control('weight').value,
        gender: form.control('gender').value,
        arrivalDate: form.control('arrivalDate').value as DateTime?,
        consultationDate: form.control('consultationDate').value as DateTime?,
        returnDate: form.control('returnDate').value as DateTime?,
        proposalNumber: form.control('proposalNumber').value,
        receptionDate: form.control('receptionDate').value,
        type: (form.control('type').value as List<dynamic>)
            .map((e) => e['type'] as String)
            .toList(),
        progress: form.control('progress').value,
        advancePaymentDate:
            form.control('advancePaymentDate').value as DateTime?,
        receivingMethod: form.control('receivingMethod').value,
        memo: form.control('memo').value,
        patient: form.control('patient').value,
      );
      if (form.control('id').value != null) {
        await updateMedicalRecords(form.control('id').value, request);
      } else {
        await postMedicalRecords(request);
      }
    } catch (error) {
      logger.d(error);
      medicalRecord.value =
          medicalRecord.value.copyWith(error: error, loading: false);
    }
  }

  // post MEDICAL_RECORDS
  Future<void> postMedicalRecords(
    MedicalRecordRequest medicalRecordRequest,
  ) async {
    await patientRepository
        .postMedicalRecord(medicalRecordRequest)
        .then((value) {
      medicalRecord.value = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      medicalRecord.value =
          medicalRecord.value.copyWith(error: error, loading: false);
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
      medicalRecord.value = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      medicalRecord.value =
          medicalRecord.value.copyWith(error: error, loading: false);
    });
  }

//GET_MEDICAL_RECORD_AGENTS
//   AsyncData<List<MedicalRecordAgent>> _medicalRecordAgents = const AsyncData();
//   AsyncData<List<MedicalRecordAgent>> get medicalRecordAgents =>
//       _medicalRecordAgents;
//
//   Future<void> getMedicalRecordAgents({
//     required String medicalRecordId,
//     required FormGroup formGroup,
//   }) async {
//     _medicalRecordAgents = const AsyncData(loading: true);
//     notifyListeners();
//
//     await patientRepository
//         .medicalRecordAgentsByMedicalRecord(medicalRecordId)
//         .then((value) {
//       _medicalRecordAgents = AsyncData(data: value);
//       insertMEDICALRECORDAGENTS(
//         data: value.first,
//         formGroup: formGroup.control('MEDICAL_RECORD_AGENTS') as FormGroup,
//       );
//     }).catchError((error) {
//       logger.d(error);
//       _medicalRecordAgents = AsyncData(error: error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
//   void insertMEDICALRECORDAGENTS({
//     required MedicalRecordAgent data,
//     required FormGroup formGroup,
//   }) {
//     formGroup.control('id').value = data.id;
//     formGroup.control('company').value = data.company;
//     formGroup.control('nameInKanji').value = data.nameInKanji;
//     formGroup.control('nameInKana').value = data.nameInKana;
//   }
//
//   // post MEDICAL_RECORD_AGENTS
//   Future<void> postMedicalRecordAgents(
//     MedicalRecordAgentRequest medicalRecordAgentRequest,
//   ) async {
//     _medicalRecordAgents = const AsyncData(loading: true);
//     notifyListeners();
//
//     await patientRepository
//         .postMedicalRecordAgent(medicalRecordAgentRequest)
//         .then((value) {
//       if (_medicalRecordAgents.data == null) {
//         _medicalRecordAgents = AsyncData(data: [value]);
//       } else {
//         _medicalRecordAgents.data?.add(value);
//       }
//     }).catchError((error) {
//       logger.d(error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
//   // update MEDICAL_RECORD_AGENTS
//   Future<void> updateMedicalRecordAgents(
//     String id,
//     MedicalRecordAgentRequest medicalRecordAgentRequest,
//   ) async {
//     await patientRepository
//         .putMedicalRecordAgent(id, medicalRecordAgentRequest)
//         .then((value) {
//       // Find from list and update or add
//       final index = _medicalRecordAgents.data?.indexWhere(
//             (element) => element.id == id,
//           ) ??
//           -1;
//       if (index >= 0) {
//         _medicalRecordAgents.data?[index] = value;
//       } else {
//         _medicalRecordAgents.data?.add(value);
//       }
//     }).catchError((error) {
//       logger.d(error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
//   //GET_MEDICAL_RECORD_BUDGETS
//   AsyncData<List<MedicalRecordReferrer>> _medicalRecordReferrers =
//       const AsyncData();
//   AsyncData<List<MedicalRecordReferrer>> get medicalRecordReferrers =>
//       _medicalRecordReferrers;
//
//   Future<void> getMedicalRecordReferrers({
//     required String medicalRecordId,
//     required FormGroup formGroup,
//   }) async {
//     _medicalRecordReferrers = const AsyncData(loading: true);
//     notifyListeners();
//
//     await patientRepository
//         .medicalRecordReferrersByMedicalRecord(medicalRecordId)
//         .then((value) {
//       _medicalRecordReferrers = AsyncData(data: value);
//       insertMEDICALRECORDReferrers(
//         data: value.first,
//         formGroup: formGroup.control('MEDICAL_RECORD_Referrers') as FormGroup,
//       );
//     }).catchError((error) {
//       logger.d(error);
//       _medicalRecordReferrers = AsyncData(error: error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
//   void insertMEDICALRECORDReferrers({
//     required MedicalRecordReferrer data,
//     required FormGroup formGroup,
//   }) {
//     formGroup.control('id').value = data.id;
//     formGroup.control('company').value = data.company;
//     formGroup.control('nameInKanji').value = data.nameInKanji;
//     formGroup.control('nameInKana').value = data.nameInKana;
//   }
//
//   // post MEDICAL_RECORD_Referrers
//   Future<void> postMedicalRecordReferrers(
//     MedicalRecordReferrerRequest medicalRecordAgentRequest,
//   ) async {
//     _medicalRecordReferrers = const AsyncData(loading: true);
//     notifyListeners();
//
//     await patientRepository
//         .postMedicalRecordReferrer(medicalRecordAgentRequest)
//         .then((value) {
//       if (_medicalRecordReferrers.data == null) {
//         _medicalRecordReferrers = AsyncData(data: [value]);
//       } else {
//         _medicalRecordReferrers.data?.add(value);
//       }
//     }).catchError((error) {
//       logger.d(error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
//   // update MEDICAL_RECORD_Referrers
//   Future<void> updateMedicalRecordReferrers(
//     String id,
//     MedicalRecordReferrerRequest medicalRecordAgentRequest,
//   ) async {
//     await patientRepository
//         .putMedicalRecordReferrer(id, medicalRecordAgentRequest)
//         .then((value) {
//       // Find from list and update or add
//       final index = _medicalRecordReferrers.data?.indexWhere(
//             (element) => element.id == id,
//           ) ??
//           -1;
//       if (index >= 0) {
//         _medicalRecordReferrers.data?[index] = value;
//       } else {
//         _medicalRecordReferrers.data?.add(value);
//       }
//     }).catchError((error) {
//       logger.d(error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
// // GET_MEDICAL_RECORD_BUDGETS
//   AsyncData<List<MedicalRecordBudget>> _medicalRecordBudgets =
//       const AsyncData();
//   AsyncData<List<MedicalRecordBudget>> get medicalRecordBudgets =>
//       _medicalRecordBudgets;
//
//   Future<void> getMedicalRecordBudgets({
//     required String medicalRecordId,
//     required FormGroup formGroup,
//   }) async {
//     _medicalRecordBudgets = const AsyncData(loading: true);
//     notifyListeners();
//
//     await patientRepository
//         .medicalRecordBudgetsByMedicalRecord(medicalRecordId)
//         .then((value) {
//       _medicalRecordBudgets = AsyncData(data: value);
//       insertMEDICALRECORDBUDGETS(
//         data: value.first,
//         formGroup: formGroup.control('MEDICAL_RECORD_BUDGETS') as FormGroup,
//       );
//     }).catchError((error) {
//       logger.d(error);
//       _medicalRecordBudgets = AsyncData(error: error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
//   void insertMEDICALRECORDBUDGETS({
//     required MedicalRecordBudget data,
//     required FormGroup formGroup,
//   }) {
//     formGroup.control('id').value = data.id;
//     formGroup.control('budget').value = data.budget.toString();
//     formGroup.control('remarks').value = data.remarks;
//   }
//
//   // post MEDICAL_RECORD_BUDGETS
//   Future<void> postMedicalRecordBudgets(
//     MedicalRecordBudgetRequest medicalRecordBudgetRequest,
//   ) async {
//     _medicalRecordBudgets = const AsyncData(loading: true);
//     notifyListeners();
//
//     await patientRepository
//         .postMedicalRecordBudget(medicalRecordBudgetRequest)
//         .then((value) {
//       if (_medicalRecordBudgets.data == null) {
//         _medicalRecordBudgets = AsyncData(data: [value]);
//       } else {
//         _medicalRecordBudgets.data?.add(value);
//       }
//     }).catchError((error) {
//       logger.d(error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
//   // update MEDICAL_RECORD_BUDGETS
//   Future<void> updateMedicalRecordBudgets(
//     String id,
//     MedicalRecordBudgetRequest medicalRecordBudgetRequest,
//   ) async {
//     await patientRepository
//         .putMedicalRecordBudget(id, medicalRecordBudgetRequest)
//         .then((value) {
//       // Find from list and update or add
//       final index = _medicalRecordBudgets.data?.indexWhere(
//             (element) => element.id == id,
//           ) ??
//           -1;
//       if (index >= 0) {
//         _medicalRecordBudgets.data?[index] = value;
//       } else {
//         _medicalRecordBudgets.data?.add(value);
//       }
//     }).catchError((error) {
//       logger.d(error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
// //GET_MEDICAL_RECORD_COMPANIONS
//   AsyncData<List<MedicalRecordCompanion>> _medicalRecordCompanions =
//       const AsyncData();
//   AsyncData<List<MedicalRecordCompanion>> get medicalRecordCompanions =>
//       _medicalRecordCompanions;
//
//   Future<void> getMedicalRecordCompanions({
//     required String medicalRecordId,
//     required FormGroup formGroup,
//   }) async {
//     _medicalRecordCompanions = const AsyncData(loading: true);
//     notifyListeners();
//
//     await patientRepository
//         .medicalRecordCompanionsByMedicalRecord(medicalRecordId)
//         .then((value) {
//       _medicalRecordCompanions = AsyncData(data: value);
//       insertMEDICALRECORDCOMPANIONS(
//         data: value,
//         formArray: formGroup.control('MEDICAL_RECORD_Companion') as FormArray,
//       );
//     }).catchError((error) {
//       logger.d(error);
//       _medicalRecordCompanions = AsyncData(error: error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
//   void insertMEDICALRECORDCOMPANIONS({
//     required List<MedicalRecordCompanion> data,
//     required FormArray formArray,
//   }) {
//     try {
//       logger.d(data.length);
//       if (data.isNotEmpty) {
//         formArray.clear();
//         for (var element in data) {
//           logger.d(element.toJson());
//           formArray.add(
//             FormGroup({
//               'id': FormControl<String?>(value: element.id),
//               'leader': FormControl<bool>(value: element.leader),
//               'remarks': FormControl<String?>(value: element.remarks ?? ''),
//               'nameInRomanized':
//                   FormControl<String?>(value: element.nameInRomanized),
//               'nameInChineseOrKanji':
//                   FormControl<String?>(value: element.nameInChineseOrKanji),
//               'nameInJapaneseKanji':
//                   FormControl<String?>(value: element.nameInJapaneseKanji),
//               'nameInKana': FormControl<String?>(value: element.nameInKana),
//               'nationality': FormControl<String?>(value: element.nationality),
//               'relationship': FormControl<String>(value: element.relationship),
//               'dateOfBirth': FormControl<DateTime>(value: element.dateOfBirth),
//               'age': FormControl<int?>(value: element.age ?? 0),
//               'gender': FormControl<bool>(),
//               'passportNumber':
//                   FormControl<String?>(value: element.passportNumber),
//               'issueDate': FormControl<DateTime>(value: element.issueDate),
//               'expirationDate':
//                   FormControl<DateTime>(value: element.expirationDate),
//               'visaType': FormControl<String>(value: element.visaType),
//             }),
//           );
//         }
//       }
//     } catch (e) {
//       logger.d(e);
//     }
//   }
//
//   // post MEDICAL_RECORD_COMPANIONS
//   Future<void> postMedicalRecordCompanions(
//     MedicalRecordCompanionRequest medicalRecordCompanionRequest,
//   ) async {
//     await patientRepository
//         .postMedicalRecordCompanion(medicalRecordCompanionRequest)
//         .then((value) {
//       if (_medicalRecordCompanions.data == null) {
//         _medicalRecordCompanions = AsyncData(data: [value]);
//       } else {
//         _medicalRecordCompanions.data?.add(value);
//       }
//     }).catchError((error) {
//       logger.d(error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
//   // update MEDICAL_RECORD_COMPANIONS
//   Future<void> updateMedicalRecordCompanions(
//     String id,
//     MedicalRecordCompanionRequest medicalRecordCompanionRequest,
//   ) async {
//     await patientRepository
//         .putMedicalRecordCompanion(id, medicalRecordCompanionRequest)
//         .then((value) {
//       // Find from list and update or add
//       final index = _medicalRecordCompanions.data?.indexWhere(
//             (element) => element.id == id,
//           ) ??
//           -1;
//       if (index >= 0) {
//         _medicalRecordCompanions.data?[index] = value;
//       } else {
//         _medicalRecordCompanions.data?.add(value);
//       }
//     }).catchError((error) {
//       logger.d(error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
//   // delete deleteMedicalRecordCompanions
//
//   Future<void> deleteMedicalRecordCompanions(
//     String id,
//   ) async {
//     await patientRepository.deleteMedicalRecordCompanion(id).then((value) {
//       // Find from list and update or add
//       final index = _medicalRecordCompanions.data?.indexWhere(
//             (element) => element.id == id,
//           ) ??
//           -1;
//       if (index >= 0) {
//         _medicalRecordCompanions.data?.removeAt(index);
//       }
//     }).catchError((error) {
//       logger.d(error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }

// //GET_MEDICAL_RECORD_HOSPITALS
  ValueNotifier<AsyncData<List<MedicalRecordHospital>>> medicalRecordHospitals =
      ValueNotifier<AsyncData<List<MedicalRecordHospital>>>(const AsyncData());

  Future<void> getMedicalRecordHospitals({
    required String medicalRecordId,
    required FormGroup formGroup,
  }) async {
    medicalRecordHospitals.value = const AsyncData(loading: true);

    await patientRepository
        .medicalRecordHospitalsByMedicalRecord(medicalRecordId)
        .then((value) {
      medicalRecordHospitals.value = AsyncData(data: value);
      insertMedicalRecordHospitals(
        data: value,
        formArray: formGroup.control('MEDICAL_RECORD_HOSPITALS') as FormArray,
      );
    }).catchError((error) {
      logger.d(error);
      medicalRecordHospitals.value = AsyncData(error: error);
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
    try {
      medicalRecordHospitals.value =
          medicalRecordHospitals.value.copyWith(loading: true);
      await formGroup.control('MEDICAL_RECORD_HOSPITALS').value.forEach(
        (element) async {
          MedicalRecordHospitalRequest request = MedicalRecordHospitalRequest(
            medicalCardNumber: element['medicalCardNumber'],
            hospitalName: element['hospitalName'],
            medicalRecord: medicalRecord.value.requireData.id,
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
    } catch (error) {
      logger.d(error);
      medicalRecordHospitals.value = AsyncData(error: error);
    }
  }

  // post MEDICAL_RECORD_HOSPITALS
  Future<void> postMedicalRecordHospitals(
    MedicalRecordHospitalRequest medicalRecordHospitalRequest,
  ) async {
    await patientRepository
        .postMedicalRecordHospital(medicalRecordHospitalRequest)
        .then((value) {
      if (medicalRecordHospitals.value.data == null) {
        medicalRecordHospitals.value = AsyncData(data: [value]);
      } else {
        medicalRecordHospitals.value = AsyncData(data: [
          ...medicalRecordHospitals.value.requireData,
          value,
        ]);
      }
    }).catchError((error) {
      logger.d(error);
      medicalRecordHospitals.value = AsyncData(error: error);
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
      final index = medicalRecordHospitals.value.data?.indexWhere(
            (element) => element.id == id,
          ) ??
          -1;
      if (index >= 0) {
        medicalRecordHospitals.value = AsyncData(
          data: [
            ...medicalRecordHospitals.value.requireData
                .map((e) => e.id == id ? value : e)
          ],
        );
      } else {
        medicalRecordHospitals.value = AsyncData(data: [value]);
      }
    }).catchError((error) {
      logger.d(error);
      medicalRecordHospitals.value = AsyncData(error: error);
    });
  }

  // delete MEDICAL_RECORD_HOSPITALS
  Future<void> deleteMedicalRecordHospitals(
    String id,
  ) async {
    await patientRepository.deleteMedicalRecordHospital(id).then((value) {
      // Find from list and update or add
      final index = medicalRecordHospitals.value.data?.indexWhere(
            (element) => element.id == id,
          ) ??
          -1;
      if (index >= 0) {
        medicalRecordHospitals.value = AsyncData(
          data: [
            ...medicalRecordHospitals.value.requireData
                .where((element) => element.id != id)
          ],
        );
      } else {
        medicalRecordHospitals.value =
            AsyncData(data: medicalRecordHospitals.value.requireData);
      }
    }).catchError((error) {
      logger.d(error);
      medicalRecordHospitals.value = AsyncData(error: error);
    });
  }

// //GET_MEDICAL_RECORD_INTERPRETERS
//   AsyncData<List<MedicalRecordInterpreter>> _medicalRecordInterpreters =
//       const AsyncData();
//   AsyncData<List<MedicalRecordInterpreter>> get medicalRecordInterpreters =>
//       _medicalRecordInterpreters;
//
//   Future<void> getMedicalRecordInterpreters({
//     required String medicalRecordId,
//     required FormGroup formGroup,
//   }) async {
//     _medicalRecordInterpreters = const AsyncData(loading: true);
//     notifyListeners();
//
//     await patientRepository
//         .medicalRecordInterpretersByMedicalRecord(medicalRecordId)
//         .then((value) {
//       _medicalRecordInterpreters = AsyncData(data: value);
//       insertMedicalRecordInterpreters(
//         data: value.first,
//         formGroup: formGroup.control('MEDICAL_RECORD_Interpreter') as FormGroup,
//       );
//     }).catchError((error) {
//       logger.d(error);
//       _medicalRecordInterpreters = AsyncData(error: error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
//   void insertMedicalRecordInterpreters({
//     required MedicalRecordInterpreter data,
//     required FormGroup formGroup,
//   }) {
//     formGroup.control('id').value = data.id;
//     formGroup.control('requiredOrUnnnecessary').value =
//         data.requiredOrUnnnecessary ? '要' : '不要';
//     formGroup.control('interpreter').value = data.interpreter;
//   }
//
//   // post MEDICAL_RECORD_INTERPRETERS
//   Future<void> postMedicalRecordInterpreters(
//     MedicalRecordInterpreterRequest medicalRecordInterpreterRequest,
//   ) async {
//     await patientRepository
//         .postMedicalRecordInterpreter(medicalRecordInterpreterRequest)
//         .then((value) {
//       if (_medicalRecordInterpreters.data == null) {
//         _medicalRecordInterpreters = AsyncData(data: [value]);
//       } else {
//         _medicalRecordInterpreters.data?.add(value);
//       }
//     }).catchError((error) {
//       logger.d(error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
//   // update MEDICAL_RECORD_INTERPRETERS
//   Future<void> updateMedicalRecordInterpreters(
//     String id,
//     MedicalRecordInterpreterRequest medicalRecordInterpreterRequest,
//   ) async {
//     await patientRepository
//         .putMedicalRecordInterpreter(id, medicalRecordInterpreterRequest)
//         .then((value) {
//       // Find from list and update or add
//       final index = _medicalRecordInterpreters.data?.indexWhere(
//             (element) => element.id == id,
//           ) ??
//           -1;
//       if (index >= 0) {
//         _medicalRecordInterpreters.data?[index] = value;
//       } else {
//         _medicalRecordInterpreters.data?.add(value);
//       }
//     }).catchError((error) {
//       logger.d(error);
//     }).whenComplete(() {
//       notifyListeners();
//     });
//   }
//
//   Future<void> createUpdatePatientNationalities(FormGroup form) async {
//     PatientNationalityRequest request = PatientNationalityRequest(
//       nationality: form.control('nationality').value,
//       nativeLanguage: form.control('nativeLanguage').value,
//       residentialArea: form.control('residentialArea').value,
//       currentAddress: form.control('currentAddress').value,
//       mobileNumber: form.control('mobileNumber').value,
//       patient: _patient.id,
//     );
//
//     if (form.control('id').value != null) {
//       await updatePatientNationalities(form.control('id').value, request);
//     } else {
//       await postPatientNationalities(request);
//     }
//   }
//
//   Future<void> createUpdateMedicalRecordBudgets(FormGroup form) async {
//     MedicalRecordBudgetRequest request = MedicalRecordBudgetRequest(
//       budget: double.tryParse(form.control('budget').value) ?? 0.0,
//       remarks: form.control('remarks').value,
//       medicalRecord: _medicalRecord.data?.id,
//     );
//
//     if (form.control('id').value != null) {
//       await updateMedicalRecordBudgets(form.control('id').value, request);
//     } else {
//       await postMedicalRecordBudgets(request);
//     }
//   }
//
//   Future<void> createUpdateMedicalRecordAgents(FormGroup form) async {
//     MedicalRecordAgentRequest request = MedicalRecordAgentRequest(
//       company: form.control('company').value,
//       nameInKanji: form.control('nameInKanji').value,
//       nameInKana: form.control('nameInKana').value,
//       medicalRecord: _medicalRecord.data?.id,
//     );
//
//     if (form.control('id').value != null) {
//       await updateMedicalRecordAgents(form.control('id').value, request);
//     } else {
//       await postMedicalRecordAgents(request);
//     }
//   }
//
//   Future<void> createUpdateMedicalRecordReferrers(FormGroup form) async {
//     MedicalRecordReferrerRequest request = MedicalRecordReferrerRequest(
//       company: form.control('company').value,
//       nameInKanji: form.control('nameInKanji').value,
//       nameInKana: form.control('nameInKana').value,
//       medicalRecord: _medicalRecord.data?.id,
//     );
//
//     if (form.control('id').value != null) {
//       await updateMedicalRecordReferrers(form.control('id').value, request);
//     } else {
//       await postMedicalRecordReferrers(request);
//     }
//   }
//
//   Future<void> createUpdateMedicalRecordInterpreters(FormGroup control) async {
//     MedicalRecordInterpreterRequest request = MedicalRecordInterpreterRequest(
//       requiredOrUnnnecessary:
//           control.control('requiredOrUnnnecessary').value == '要' ? true : false,
//       interpreter: control.control('interpreter').value,
//       medicalRecord: _medicalRecord.data?.id,
//     );
//
//     if (control.control('id').value != null) {
//       await updateMedicalRecordInterpreters(
//           control.control('id').value, request);
//     } else {
//       await postMedicalRecordInterpreters(request);
//     }
//   }
//
//   Future<void> createUpdatePatientPassports(FormGroup form) async {
//     PatientPassportRequest request = PatientPassportRequest(
//       passportNumber: form.control('passportNumber').value,
//       issueDate: form.control('issueDate').value,
//       expirationDate: form.control('expirationDate').value,
//       visaType: form.control('visaType').value,
//       visaCategory: form.control('visaCategory').value,
//       underConfirmation: form.control('underConfirmation').value,
//       patient: _patient.id,
//     );
//
//     if (form.control('id').value != null) {
//       await updatePatientPassports(form.control('id').value, request);
//     } else {
//       await postPatientPassports(request);
//     }
//   }
//
//   Future<void> createUpdateMedicalRecordCompanions(FormGroup form) async {
//     await form
//         .control('MEDICAL_RECORD_Companion')
//         .value
//         .forEach((element) async {
//       MedicalRecordCompanionRequest request = MedicalRecordCompanionRequest(
//         leader: element['leader'],
//         remarks: element['remarks'],
//         nameInRomanized: element['nameInRomanized'],
//         nameInChineseOrKanji: element['nameInChineseOrKanji'],
//         nameInJapaneseKanji: element['nameInJapaneseKanji'],
//         nameInKana: element['nameInKana'],
//         nationality: element['nationality'],
//         relationship: element['relationship'],
//         dateOfBirth: element['dateOfBirth'],
//         age:
//             ageCalculator(DateTime.tryParse(element['dateOfBirth'].toString())),
//         gender: element['gender'],
//         passportNumber: element['passportNumber'],
//         issueDate: element['issueDate'],
//         expirationDate: element['expirationDate'],
//         visaType: element['visaType'],
//         medicalRecord: _medicalRecord.data?.id,
//       );
//
//       if (element['id'] != null) {
//         if (element['nameInRomanized'] != null &&
//             element['nameInRomanized'] != '' &&
//             element['passportNumber'] != null &&
//             element['passportNumber'] != '') {
//           await updateMedicalRecordCompanions(element['id'], request);
//         } else {
//           await deleteMedicalRecordCompanions(element['id']);
//         }
//       } else {
//         if (element['nameInRomanized'] != null &&
//             element['nameInRomanized'] != '' &&
//             element['dateOfBirth'] != null &&
//             element['dateOfBirth'] != '' &&
//             element['passportNumber'] != null &&
//             element['passportNumber'] != '' &&
//             element['issueDate'] != null &&
//             element['issueDate'] != '' &&
//             element['expirationDate'] != null &&
//             element['expirationDate'] != '') {
//           await postMedicalRecordCompanions(request);
//         }
//       }
//     });
//   }
}
