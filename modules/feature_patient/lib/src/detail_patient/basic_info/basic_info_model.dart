// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
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

  ValueNotifier<AsyncData<User>> userAccount =
      ValueNotifier<AsyncData<User>>(const AsyncData());

  Future<void> initialData({
    Patient? patient,
    String? id,
    required FormGroup formGroup,
  }) async {
    loading.value = const AsyncData(loading: true);

    if (patient != null) {
      try {
        patientData.value = AsyncData(data: patient);
        await getPatientUser(userId: patient.id, formGroup: formGroup);
        await getPatientNames(patientId: patient.id, formGroup: formGroup);

        await getPatientNationalities(
            patientId: patient.id, formGroup: formGroup);
        await getPatientPassports(patientId: patient.id, formGroup: formGroup);

        await getMedicalRecords(patientId: patient.id, formGroup: formGroup);

        loading.value = const AsyncData();
      } catch (error) {
        logger.d(error);
        loading.value = AsyncData(error: error);
      }
    } else {
      loading.value = const AsyncData();
    }
  }

  // Create or Update all
  void createUpdateAll(FormGroup form) async {
    loading.value = const AsyncData(loading: true);

    if (!patientData.value.hasData) {
      try {
        patientData.value = const AsyncData(loading: true);
        final patientNameForm = form.control('PATIENT_NAMES') as FormGroup;
        var result = await patientRepository.postPatient(PatientRequest(
          dateOfBirth: form.control('dateOfBirth').value,
          age: form.control('age').value,
          gender: form.control('gender').value,
          familyName: patientNameForm.control('familyNameRomanized').value,
          middleName: patientNameForm.control('middleNameRomanized').value,
          firstName: patientNameForm.control('firstNameRomanized').value,
        ));
        patientData.value = AsyncData(data: result);
      } catch (error) {
        logger.d(error);
        loading.value = AsyncData(error: error);
      }
    }
    logger.d('createUpdateAll ${patientData.value.data?.id}');
    if (patientData.value.hasData) {
      try {
        loading.value = const AsyncData(loading: true);

        await createUpdatePatientNames(
            form.control('PATIENT_NAMES') as FormGroup);
        await createUpdatePatientNationalities(
            form.control('PATIENT_NATIONALITIES') as FormGroup);
        await createUpdatePatientPassports(
            form.control('PATIENT_PASSPORTS') as FormGroup);
        await createUpdateMedicalRecords(form);

        if (medicalRecordId.value.hasData) {
          await createUpdateMedicalRecordHospital(form);

          await createUpdateMedicalRecordAgents(
              form.control('MEDICAL_RECORD_AGENTS') as FormGroup);

          await createUpdateMedicalRecordBudgets(
              form.control('MEDICAL_RECORD_BUDGETS') as FormGroup);

          await createUpdateMedicalRecordTravelGroups(
              form.control('travelGroup') as FormGroup);

          await createUpdateMedicalRecordCompanions(form);
          await createUpdateMedicalRecordInterpreters(
              form.control('MEDICAL_RECORD_Interpreter') as FormGroup);

          logger.d('createUpdateAll');
          loading.value = const AsyncData(data: true);
        } else {
          medicalRecord.value =
              const AsyncData(error: '黄色のボックスに患者様の個人情報をご入力ください');
        }
      } catch (error) {
        logger.d(error);
        loading.value = AsyncData(error: error);
      } finally {
        await initialData(
          patient: patientData.value.requireData,
          formGroup: form,
        );
      }
    }
  }

  // //GET_PATIENT_USER

  Future<void> getPatientUser({
    required String userId,
    required FormGroup formGroup,
  }) async {
    userAccount.value = const AsyncData(loading: true);

    await patientRepository.patientUser(userId).then((value) {
      userAccount.value = AsyncData(data: value);
      logger.d(value.toJson());
      insertUserAccount(
        data: value,
        formGroup: formGroup.control('Patient_account') as FormGroup,
      );
    }).catchError((error) {
      logger.d(error);
      userAccount.value = AsyncData(error: error);
    });
  }

  void insertUserAccount({required User data, required FormGroup formGroup}) {
    formGroup.control('loginId').value = data.idNumber;
    formGroup.control('isClosed').value = data.isClosed;
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
        patientNames.value = AsyncData(data: value.first);
        insertPatientName(
          data: value.first,
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
    required PatientName data,
    required FormGroup formGroup,
  }) {
    formGroup.reset();

    // formGroup.updateValue(data.toJson());

    formGroup.control('_id').value = data.id;
    formGroup.control('familyNameRomanized').value = data.familyNameRomanized;
    formGroup.control('middleNameRomanized').value = data.middleNameRomanized;
    formGroup.control('firstNameRomanized').value = data.firstNameRomanized;
    formGroup.control('familyNameChineseOrVietnamese').value =
        data.familyNameChineseOrVietnamese;
    formGroup.control('middleNameChineseOrVietnamese').value =
        data.middleNameChineseOrVietnamese;
    formGroup.control('firstNameChineseOrVietnamese').value =
        data.firstNameChineseOrVietnamese;
    formGroup.control('familyNameJapaneseForChinese').value =
        data.familyNameJapaneseForChinese;
    formGroup.control('middleNameJapaneseForChinese').value =
        data.middleNameJapaneseForChinese;
    formGroup.control('firstNameJapaneseForChinese').value =
        data.firstNameJapaneseForChinese;
    formGroup.control('familyNameJapaneseForNonChinese').value =
        data.familyNameJapaneseForNonChinese;
    formGroup.control('middleNameJapaneseForNonChinese').value =
        data.middleNameJapaneseForNonChinese;
    formGroup.control('firstNameJapaneseForNonChinese').value =
        data.firstNameJapaneseForNonChinese;
  }

  Future<void> createUpdatePatientNames(FormGroup form) async {
    try {
      patientNames.value = const AsyncData(loading: true);

      PatientNameRequest request = PatientNameRequest(
        familyNameRomanized: form.control('familyNameRomanized').value,
        middleNameRomanized: form.control('middleNameRomanized').value ?? '',
        firstNameRomanized: form.control('firstNameRomanized').value,
        familyNameChineseOrVietnamese:
            form.control('familyNameChineseOrVietnamese').value ?? '',
        middleNameChineseOrVietnamese:
            form.control('middleNameChineseOrVietnamese').value ?? '',
        firstNameChineseOrVietnamese:
            form.control('firstNameChineseOrVietnamese').value ?? '',
        familyNameJapaneseForChinese:
            form.control('familyNameJapaneseForChinese').value ?? '',
        middleNameJapaneseForChinese:
            form.control('middleNameJapaneseForChinese').value ?? '',
        firstNameJapaneseForChinese:
            form.control('firstNameJapaneseForChinese').value ?? '',
        familyNameJapaneseForNonChinese:
            form.control('familyNameJapaneseForNonChinese').value ?? '',
        middleNameJapaneseForNonChinese:
            form.control('middleNameJapaneseForNonChinese').value ?? '',
        firstNameJapaneseForNonChinese:
            form.control('firstNameJapaneseForNonChinese').value ?? '',
        patient: patientData.value.requireData.id,
      );

      if (form.control('_id').value != null) {
        await updatePatientNames(form, form.control('_id').value, request);
      } else {
        await postPatientNames(form, request);
      }
    } catch (error) {
      logger.d(error);
      patientNames.value = AsyncData(error: error);
    }
  }

  // post PATIENT_NAMES
  Future<void> postPatientNames(
    FormGroup form,
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
    FormGroup form,
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

  // Get user account

  // ValueNotifier<AsyncData<UserAccount>> userAccount =
  //     ValueNotifier<AsyncData<UserAccount>>(const AsyncData());

//GET_PATIENT_NATIONALITIES
  ValueNotifier<AsyncData<PatientNationality>> patientNationalities =
      ValueNotifier<AsyncData<PatientNationality>>(const AsyncData());

  Future<void> getPatientNationalities({
    required String patientId,
    required FormGroup formGroup,
  }) async {
    patientNationalities.value = const AsyncData(loading: true);

    await patientRepository
        .patientNationalitiesByPatient(patientId)
        .then((value) {
      if (value.isNotEmpty) {
        patientNationalities.value = AsyncData(data: value.first);
        insertPATIENTNATIONALITIES(
            data: value.first,
            formGroup: formGroup.control('PATIENT_NATIONALITIES') as FormGroup);
      } else {
        patientNationalities.value = const AsyncData();
      }
    }).catchError((error) {
      logger.d(error);
      patientNationalities.value = AsyncData(error: error);
    });
  }

  void insertPATIENTNATIONALITIES({
    required PatientNationality data,
    required FormGroup formGroup,
  }) {
    formGroup.control('_id').value = data.id;
    formGroup.control('nationality').value = data.nationality;
    formGroup.control('nativeLanguage').value = data.nativeLanguage;
    formGroup.control('residentialArea').value = data.residentialArea;
    formGroup.control('currentAddress').value = data.currentAddress;
    formGroup.control('mobileNumber').value = data.mobileNumber;
    formGroup.control('patient').value = data.patient;
    formGroup.control('email').value = data.email;
    final chatToolLink = formGroup.control('chatToolLink') as FormArray;
    chatToolLink.clear();
    data.chatToolLink?.forEach((element) {
      chatToolLink.add(
        FormGroup({
          'chatToolLink': FormControl<String>(value: element ?? ''),
        }),
      );
    });
    if (data.chatToolLink == null || data.chatToolLink!.isEmpty) {
      chatToolLink.clear();
      chatToolLink.add(
        FormGroup({
          'chatToolLink': FormControl<String>(),
        }),
      );
    }

    formGroup.control('chatQrImage').value =
        data.chatQrImage == null ? null : FileSelect(url: data.chatQrImage);
  }

  // post PATIENT_NATIONALITIES
  Future<void> postPatientNationalities(
    FormGroup form,
    PatientNationalityRequest patientNationalityRequest,
  ) async {
    await patientRepository
        .postPatientNationality(patientNationalityRequest)
        .then((value) {
      patientNationalities.value = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      patientNationalities.value = AsyncData(error: error);
    });
  }

  Future<void> createUpdatePatientNationalities(FormGroup form) async {
    patientNationalities.value = const AsyncData(loading: true);

    List<String?> chatToolLink = [];
    if (form.control('chatToolLink').value != null) {
      for (var i = 0;
          i < (form.control('chatToolLink').value as List<dynamic>).length;
          i++) {
        if ((form.control('chatToolLink').value as List<dynamic>)[i]
                ['chatToolLink'] !=
            null) {
          chatToolLink.add((form.control('chatToolLink').value
              as List<dynamic>)[i]['chatToolLink']);
        }
      }
    }

    String? file;
    if (form.control('chatQrImage').value != null) {
      FileSelect docFile = form.control('chatQrImage').value;
      if (docFile.file != null) {
        try {
          String base64Image = base64Encode(docFile.file!);
          FileResponse fileData = await patientRepository.uploadFileBase64(
            base64Image,
            docFile.filename!,
          );
          file = fileData.filename;
        } catch (e) {
          logger.e(e);
        }
      } else {
        file = docFile.url;
      }
    }

    PatientNationalityRequest request = PatientNationalityRequest(
      nationality: form.control('nationality').value ?? '',
      nativeLanguage: form.control('nativeLanguage').value ?? '',
      residentialArea: form.control('residentialArea').value ?? '',
      currentAddress: form.control('currentAddress').value ?? '',
      mobileNumber: form.control('mobileNumber').value,
      email: form.control('email').value,
      chatToolLink: chatToolLink.isEmpty ? null : chatToolLink,
      chatQrImage: file,
      patient: patientData.value.requireData.id,
    );

    if (form.control('_id').value != null) {
      await updatePatientNationalities(
          form, form.control('_id').value, request);
    } else {
      await postPatientNationalities(form, request);
    }
  }

  // update PATIENT_NATIONALITIES
  Future<void> updatePatientNationalities(
    FormGroup form,
    String id,
    PatientNationalityRequest patientNationalityRequest,
  ) async {
    await patientRepository
        .putPatientNationality(id, patientNationalityRequest)
        .then((value) {
      patientNationalities.value = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      patientNationalities.value = AsyncData(error: error);
    });
  }

// //GET_PATIENT_PASSPORTS
  ValueNotifier<AsyncData<PatientPassport>> patientPassport = ValueNotifier(
    const AsyncData(),
  );

  Future<void> getPatientPassports({
    required String patientId,
    required FormGroup formGroup,
  }) async {
    patientPassport.value = const AsyncData(loading: true);

    await patientRepository.patientPassportsByPatient(patientId).then((value) {
      patientPassport.value = AsyncData(data: value.first);
      insertPATIENTPASSPORTS(
          data: value.first,
          formGroup: formGroup.control('PATIENT_PASSPORTS') as FormGroup);
    }).catchError((error) {
      logger.d(error);
      patientPassport.value = AsyncData(error: error);
    });
  }

  void insertPATIENTPASSPORTS({
    PatientPassport? data,
    required FormGroup formGroup,
  }) {
    formGroup.control('_id').value = data?.id;
    formGroup.control('passportNumber').value = data?.passportNumber ?? '';
    formGroup.control('issueDate').value = data?.issueDate;
    formGroup.control('expirationDate').value = data?.expirationDate;
    formGroup.control('visaType').value = data?.visaType ?? 'medicalGuarantee';
    formGroup.control('visaCategory').value = data?.visaCategory ?? '';
    formGroup.control('underConfirmation').value =
        data?.underConfirmation ?? false;
  }

  Future<void> createUpdatePatientPassports(FormGroup form) async {
    patientPassport.value = const AsyncData(loading: true);
    PatientPassportRequest request = PatientPassportRequest(
      passportNumber: form.control('passportNumber').value ?? '',
      issueDate: form.control('issueDate').value,
      expirationDate: form.control('expirationDate').value,
      visaType: form.control('visaType').value,
      visaCategory: form.control('visaCategory').value,
      underConfirmation: form.control('underConfirmation').value,
      patient: patientData.value.requireData.id,
    );

    if (form.control('_id').value != null) {
      await updatePatientPassports(form, form.control('_id').value, request);
    } else {
      await postPatientPassports(form, request);
    }
  }

  // post PATIENT_PASSPORTS
  Future<void> postPatientPassports(
    FormGroup form,
    PatientPassportRequest patientPassportRequest,
  ) async {
    await patientRepository
        .postPatientPassport(patientPassportRequest)
        .then((value) {
      patientPassport.value = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      patientPassport.value = AsyncData(error: error);
    });
  }

  // update PATIENT_PASSPORTS
  Future<void> updatePatientPassports(
    FormGroup form,
    String id,
    PatientPassportRequest patientPassportRequest,
  ) async {
    await patientRepository
        .putPatientPassport(id, patientPassportRequest)
        .then((value) {
      patientPassport.value = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      patientPassport.value = AsyncData(error: error);
    });
  }

//GET_MEDICAL_RECORDS
  ValueNotifier<AsyncData<MedicalRecord>> medicalRecord =
      ValueNotifier<AsyncData<MedicalRecord>>(const AsyncData());

  ValueNotifier<AsyncData<String>> medicalRecordId =
      ValueNotifier<AsyncData<String>>(const AsyncData());

  Future<void> getMedicalRecords({
    required String patientId,
    required FormGroup formGroup,
  }) async {
    medicalRecord.value = const AsyncData(loading: true);

    var records = await patientRepository.medicalRecordsByPatient(patientId);

    if (records.isNotEmpty) {
      medicalRecordId.value = AsyncData(data: records.first.id);
      medicalRecord.value = AsyncData(data: records.first);
      insertMedicalRecord(data: records.first, formGroup: formGroup);
    } else {
      medicalRecord.value = const AsyncData();
    }

    if (medicalRecordId.value.hasData) {
      await getMedicalRecordHospitals(
        medicalRecordId: records.first.id,
        formGroup: formGroup,
      );
      await getMedicalRecordBudgets(
        medicalRecordId: records.first.id,
        formGroup: formGroup,
      );
      await getMedicalRecordAgents(
        medicalRecordId: records.first.id,
        formGroup: formGroup,
      );

      await getMedicalRecordInterpreters(
        medicalRecordId: records.first.id,
        formGroup: formGroup,
      );

      await getMedicalRecordTravelGroups(
        medicalRecordId: records.first.id,
        formGroup: formGroup,
      );

      await getMedicalRecordCompanions(
        medicalRecordId: records.first.id,
        formGroup: formGroup,
      );
    }
  }

  void insertMedicalRecord({
    MedicalRecord? data,
    required FormGroup formGroup,
  }) {
    formGroup.control('_id').value = data?.id;
    formGroup.control('dateOfBirth').value = data?.dateOfBirth;
    formGroup.control('age').value = data?.age;
    formGroup.control('height').value = data?.height;
    formGroup.control('weight').value = data?.weight;
    formGroup.control('gender').value = data?.gender;
    formGroup.control('isMale').value = data?.gender == true;
    formGroup.control('isFemale').value = !(data?.gender == true);
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
          'type': FormControl<String>(value: element),
        }),
      );
    });

    if (data?.type == null || data?.type?.isEmpty == true) {
      type.add(
        FormGroup({
          'type': FormControl<String>(),
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
      List<String?> type = [];

      if (form.control('type').value != null) {
        for (var i = 0;
            i < (form.control('type').value as List<dynamic>).length;
            i++) {
          if ((form.control('type').value as List<dynamic>)[i]['type'] !=
                  null ||
              (form.control('type').value as List<dynamic>)[i]['type'] != '') {
            type.add((form.control('type').value as List<dynamic>)[i]['type']);
          }
        }
      }

      MedicalRecordRequest request = MedicalRecordRequest(
        dateOfBirth: form.control('dateOfBirth').value,
        age: form.control('age').value ?? 0,
        height: form.control('height').value ?? 0,
        weight: form.control('weight').value ?? 0,
        gender: form.control('gender').value,
        arrivalDate: form.control('arrivalDate').value as DateTime?,
        consultationDate: form.control('consultationDate').value as DateTime?,
        returnDate: form.control('returnDate').value as DateTime?,
        proposalNumber: form.control('proposalNumber').value,
        receptionDate: form.control('receptionDate').value,
        type: type.isEmpty ? null : type,
        progress: form.control('progress').value,
        advancePaymentDate:
            form.control('advancePaymentDate').value as DateTime?,
        receivingMethod: form.control('receivingMethod').value,
        memo: form.control('memo').value,
        patient: patientData.value.requireData.id,
      );
      if (form.control('_id').value != null) {
        await updateMedicalRecords(form, form.control('_id').value, request);
      } else {
        await postMedicalRecords(form, request);
      }
    } catch (error) {
      logger.d(error);
      medicalRecord.value =
          medicalRecord.value.copyWith(error: error, loading: false);
    }
  }

  // post MEDICAL_RECORDS
  Future<void> postMedicalRecords(
    FormGroup form,
    MedicalRecordRequest medicalRecordRequest,
  ) async {
    await patientRepository
        .postMedicalRecord(medicalRecordRequest)
        .then((value) {
      medicalRecordId.value = AsyncData(data: value.id);
      medicalRecord.value = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      medicalRecord.value =
          medicalRecord.value.copyWith(error: error, loading: false);
    });
  }

  // update MEDICAL_RECORDS
  Future<void> updateMedicalRecords(
    FormGroup form,
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
  ValueNotifier<AsyncData<MedicalRecordAgent>> medicalRecordAgents =
      ValueNotifier<AsyncData<MedicalRecordAgent>>(const AsyncData());

  Future<void> getMedicalRecordAgents({
    required String medicalRecordId,
    required FormGroup formGroup,
  }) async {
    medicalRecordAgents.value = const AsyncData(loading: true);

    await patientRepository
        .medicalRecordAgentsByMedicalRecord(medicalRecordId)
        .then((value) {
      medicalRecordAgents.value = AsyncData(data: value.firstOrNull);
      insertMEDICALRECORDAGENTS(
        data: value.firstOrNull,
        formGroup: formGroup.control('MEDICAL_RECORD_AGENTS') as FormGroup,
      );
    }).catchError((error) {
      logger.d(error);
      medicalRecordAgents.value = AsyncData(error: error);
    });
  }

  void insertMEDICALRECORDAGENTS({
    MedicalRecordAgent? data,
    required FormGroup formGroup,
  }) {
    formGroup.control('_id').value = data?.id;
    formGroup.control('company').value = data?.company;
    formGroup.control('nameInKanji').value = data?.nameInKanji;
    formGroup.control('nameInKana').value = data?.nameInKana;
  }

  Future<void> createUpdateMedicalRecordAgents(FormGroup form) async {
    medicalRecordAgents.value = const AsyncData(loading: true);
    MedicalRecordAgentRequest request = MedicalRecordAgentRequest(
      company: form.control('company').value ?? '',
      nameInKanji: form.control('nameInKanji').value ?? '',
      nameInKana: form.control('nameInKana').value ?? '',
      medicalRecord: medicalRecordId.value.requireData,
    );

    if (form.control('_id').value != null) {
      await updateMedicalRecordAgents(form, form.control('_id').value, request);
    } else {
      await postMedicalRecordAgents(form, request);
    }
  }

  // post MEDICAL_RECORD_AGENTS
  Future<void> postMedicalRecordAgents(
    FormGroup form,
    MedicalRecordAgentRequest medicalRecordAgentRequest,
  ) async {
    await patientRepository
        .postMedicalRecordAgent(medicalRecordAgentRequest)
        .then((value) {
      medicalRecordAgents.value = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      medicalRecordAgents.value = AsyncData(error: error);
    });
  }

  // update MEDICAL_RECORD_AGENTS
  Future<void> updateMedicalRecordAgents(
    FormGroup form,
    String id,
    MedicalRecordAgentRequest medicalRecordAgentRequest,
  ) async {
    await patientRepository
        .putMedicalRecordAgent(id, medicalRecordAgentRequest)
        .then((value) {
      medicalRecordAgents.value = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      medicalRecordAgents.value = AsyncData(error: error);
    });
  }

// GET_MEDICAL_RECORD_BUDGETS

  ValueNotifier<AsyncData<MedicalRecordBudget>> medicalRecordBudgets =
      ValueNotifier(
    const AsyncData(),
  );

  Future<void> getMedicalRecordBudgets({
    required String medicalRecordId,
    required FormGroup formGroup,
  }) async {
    medicalRecordBudgets.value = const AsyncData(loading: true);

    await patientRepository
        .medicalRecordBudgetsByMedicalRecord(medicalRecordId)
        .then((value) {
      medicalRecordBudgets.value = AsyncData(data: value.firstOrNull);
      if (value.isNotEmpty) {
        insertMEDICALRECORDBUDGETS(
          data: value.first,
          formGroup: formGroup.control('MEDICAL_RECORD_BUDGETS') as FormGroup,
        );
      }
    }).catchError((error) {
      logger.d(error);
      medicalRecordBudgets.value = AsyncData(error: error);
    });
  }

  void insertMEDICALRECORDBUDGETS({
    required MedicalRecordBudget data,
    required FormGroup formGroup,
  }) {
    formGroup.control('_id').value = data.id;
    formGroup.control('budget').value = data.budget ?? 0;
    formGroup.control('remarks').value = data.remarks;
  }

  // post MEDICAL_RECORD_BUDGETS
  Future<void> postMedicalRecordBudgets(
    FormGroup form,
    MedicalRecordBudgetRequest medicalRecordBudgetRequest,
  ) async {
    medicalRecordBudgets.value = const AsyncData(loading: true);

    await patientRepository
        .postMedicalRecordBudget(medicalRecordBudgetRequest)
        .then((value) {
      medicalRecordBudgets.value = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      medicalRecordBudgets.value = AsyncData(error: error);
    });
  }

  Future<void> createUpdateMedicalRecordBudgets(FormGroup form) async {
    MedicalRecordBudgetRequest request = MedicalRecordBudgetRequest(
      budget: form.control('budget').value ?? 0,
      remarks: form.control('remarks').value ?? '',
      medicalRecord: medicalRecordId.value.requireData,
    );

    if (form.control('_id').value != null) {
      await updateMedicalRecordBudgets(
          form, form.control('_id').value, request);
    } else {
      await postMedicalRecordBudgets(form, request);
    }
  }

  // update MEDICAL_RECORD_BUDGETS
  Future<void> updateMedicalRecordBudgets(
    FormGroup form,
    String id,
    MedicalRecordBudgetRequest medicalRecordBudgetRequest,
  ) async {
    await patientRepository
        .putMedicalRecordBudget(id, medicalRecordBudgetRequest)
        .then((value) {
      medicalRecordBudgets.value = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      medicalRecordBudgets.value = AsyncData(error: error);
    });
  }

// //GET_MEDICAL_RECORD_COMPANIONS
  ValueNotifier<AsyncData<List<MedicalRecordCompanion>>>
      medicalRecordCompanions =
      ValueNotifier<AsyncData<List<MedicalRecordCompanion>>>(const AsyncData());

  Future<void> getMedicalRecordCompanions({
    required String medicalRecordId,
    required FormGroup formGroup,
  }) async {
    medicalRecordCompanions.value = const AsyncData(loading: true);

    await patientRepository
        .medicalRecordCompanionsByMedicalRecord(medicalRecordId)
        .then((value) {
      medicalRecordCompanions.value = AsyncData(data: value);
      insertMEDICALRECORDCOMPANIONS(
        data: value,
        formArray: formGroup.control('MEDICAL_RECORD_Companion') as FormArray,
      );
    }).catchError((error) {
      logger.d(error);
      medicalRecordCompanions.value = AsyncData(error: error);
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
          FormArray chatToolLink = FormArray([]);
          chatToolLink.clear();
          if (element.chatToolLink != null &&
              element.chatToolLink!.isNotEmpty) {
            for (var i = 0; i < element.chatToolLink!.length; i++) {
              chatToolLink.add(
                FormGroup({
                  'chatToolLink': FormControl<String>(
                    value: element.chatToolLink![i],
                  ),
                }),
              );
            }
          } else {
            chatToolLink.add(
              FormGroup({
                'chatToolLink': FormControl<String>(),
              }),
            );
          }

          formArray.add(
            FormGroup({
              '_id': FormControl<String?>(
                value: element.id,
              ),
              'leader': FormControl<bool>(
                value: element.leader,
              ),
              'remarks': FormControl<String?>(
                value: element.remarks,
              ),
              'familyNameRomanized': FormControl<String?>(
                value: element.familyNameRomanized,
              ),
              'middleNameRomanized': FormControl<String?>(
                value: element.middleNameRomanized,
              ),
              'firstNameRomanized': FormControl<String?>(),
              'familyNameChineseOrVietnamese': FormControl<String?>(
                value: element.familyNameChineseOrVietnamese,
              ),
              'middleNameChineseOrVietnamese': FormControl<String?>(
                value: element.middleNameChineseOrVietnamese,
              ),
              'firstNameChineseOrVietnamese': FormControl<String?>(
                value: element.firstNameChineseOrVietnamese,
              ),
              'familyNameJapaneseForChinese': FormControl<String?>(
                value: element.familyNameJapaneseForChinese,
              ),
              'middleNameJapaneseForChinese': FormControl<String?>(
                value: element.middleNameJapaneseForChinese,
              ),
              'firstNameJapaneseForChinese': FormControl<String?>(
                value: element.firstNameJapaneseForChinese,
              ),
              'familyNameJapaneseForNonChinese': FormControl<String?>(
                value: element.familyNameJapaneseForNonChinese,
              ),
              'middleNameJapaneseForNonChinese': FormControl<String?>(
                value: element.middleNameJapaneseForNonChinese,
              ),
              'firstNameJapaneseForNonChinese': FormControl<String?>(
                value: element.firstNameJapaneseForNonChinese,
              ),
              'nationality': FormControl<String?>(value: element.nationality),
              'relationship': FormControl<String>(
                value: element.relationship,
              ),
              'dateOfBirth': FormControl<DateTime>(
                value: element.dateOfBirth,
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'age': FormControl<int?>(
                value: element.age,
              ),
              'gender': FormControl<bool>(
                value: element.gender,
              ),
              'isMale': FormControl<bool>(
                value: element.gender == true,
              ),
              'isFemale': FormControl<bool>(
                value: !(element.gender == true),
              ),
              'mobileNumber': FormControl<String?>(
                value: element.mobileNumber,
              ),
              'email': FormControl<String?>(
                value: element.email,
                validators: [
                  Validators.email,
                ],
              ),
              'chatToolLink': chatToolLink,
              'chatQrImage': FormControl<FileSelect>(
                value: element.chatQrImage == null
                    ? null
                    : FileSelect(url: element.chatQrImage),
              ),
              'passportNumber': FormControl<String?>(
                value: element.passportNumber,
              ),
              'issueDate': FormControl<DateTime>(
                value: element.issueDate,
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'expirationDate': FormControl<DateTime>(
                value: element.expirationDate,
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'visaType': FormControl<String>(
                value: element.visaType,
              ),
            }),
          );
        }
      }
    } catch (e) {
      logger.d(e);
      medicalRecordCompanions.value = AsyncData(error: e);
    }
  }

  // post MEDICAL_RECORD_COMPANIONS
  Future<void> postMedicalRecordCompanions(
    MedicalRecordCompanionRequest medicalRecordCompanionRequest,
  ) async {
    await patientRepository
        .postMedicalRecordCompanion(medicalRecordCompanionRequest)
        .then((value) {
      if (medicalRecordCompanions.value.data == null) {
        medicalRecordCompanions.value = AsyncData(data: [value]);
      } else {
        medicalRecordCompanions.value = AsyncData(data: [
          ...medicalRecordCompanions.value.requireData,
          value,
        ]);
      }
    }).catchError((error) {
      logger.d(error);
      medicalRecordCompanions.value = AsyncData(error: error);
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
      medicalRecordCompanions.value = AsyncData(
        data: [
          ...medicalRecordCompanions.value.requireData
              .map((e) => e.id == id ? value : e)
        ],
      );
    }).catchError((error) {
      logger.d(error);
      medicalRecordCompanions.value = AsyncData(error: error);
    });
  }

  // delete deleteMedicalRecordCompanions

  Future<void> deleteMedicalRecordCompanions(
    String id,
  ) async {
    await patientRepository.deleteMedicalRecordCompanion(id).then((value) {
      medicalRecordCompanions.value = AsyncData(
        data: [
          ...medicalRecordCompanions.value.requireData
              .where((element) => element.id != id)
        ],
      );
    }).catchError((error) {
      logger.d(error);
      medicalRecordCompanions.value = AsyncData(error: error);
    });
  }

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
            '_id': FormControl<String?>(value: element.id),
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
      logger.d('medical-record-hospitals 111');
      medicalRecordHospitals.value =
          medicalRecordHospitals.value.copyWith(loading: true);
      logger.d(formGroup.control('deletedMedicalRecordHospitals').value);
      await formGroup.control('deletedMedicalRecordHospitals').value.forEach(
        (element) async {
          if (element != null) {
            await deleteMedicalRecordHospitals(element);
          }
        },
      );
      logger.d('medical-record-hospitals 111');
      logger.d(formGroup.control('MEDICAL_RECORD_HOSPITALS').value);

      await formGroup.control('MEDICAL_RECORD_HOSPITALS').value.forEach(
        (element) async {
          MedicalRecordHospitalRequest request = MedicalRecordHospitalRequest(
            medicalCardNumber: element['medicalCardNumber'] ?? '',
            hospitalName: element['hospitalName'] ?? '',
            medicalRecord: medicalRecordId.value.requireData,
          );

          if (element['_id'] != null) {
            if (element['hospitalName'].isEmpty &&
                element['medicalCardNumber'].isEmpty) {
              await deleteMedicalRecordHospitals(element['_id']);
            } else {
              await updateMedicalRecordHospitals(element['_id'], request);
            }
          } else {
            if (element['hospitalName'] != null &&
                element['medicalCardNumber'] != null) {
              await postMedicalRecordHospitals(formGroup, request);
            }
          }
        },
      );
      medicalRecordHospitals.value = medicalRecordHospitals.value.copyWith(
        loading: false,
      );
    } catch (error) {
      logger.d('medical-record-hospitals 111');
      logger.d(error);
      medicalRecordHospitals.value = AsyncData(error: error);
    }
  }

  // post MEDICAL_RECORD_HOSPITALS
  Future<void> postMedicalRecordHospitals(
    FormGroup form,
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
  ValueNotifier<AsyncData<MedicalRecordInterpreter>> medicalRecordInterpreters =
      ValueNotifier(
    const AsyncData(),
  );

  Future<void> getMedicalRecordInterpreters({
    required String medicalRecordId,
    required FormGroup formGroup,
  }) async {
    medicalRecordInterpreters.value = const AsyncData(loading: true);

    await patientRepository
        .medicalRecordInterpretersByMedicalRecord(medicalRecordId)
        .then((value) {
      medicalRecordInterpreters.value = AsyncData(data: value.firstOrNull);
      insertMedicalRecordInterpreters(
        data: value.firstOrNull,
        formGroup: formGroup.control('MEDICAL_RECORD_Interpreter') as FormGroup,
      );
    }).catchError((error) {
      logger.d(error);
      medicalRecordInterpreters.value = AsyncData(error: error);
    });
  }

  void insertMedicalRecordInterpreters({
    MedicalRecordInterpreter? data,
    required FormGroup formGroup,
  }) {
    formGroup.control('_id').value = data?.id;
    formGroup.control('requiredOrUnnnecessary').value =
        data?.requiredOrUnnnecessary == true ? '要' : '不要';
    formGroup.control('interpreter').value = data?.interpreter;
  }

  // post MEDICAL_RECORD_INTERPRETERS
  Future<void> postMedicalRecordInterpreters(
    MedicalRecordInterpreterRequest medicalRecordInterpreterRequest,
  ) async {
    await patientRepository
        .postMedicalRecordInterpreter(medicalRecordInterpreterRequest)
        .then((value) {
      medicalRecordInterpreters.value = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      medicalRecordInterpreters.value = AsyncData(error: error);
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
      medicalRecordInterpreters.value = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      medicalRecordInterpreters.value = AsyncData(error: error);
    });
  }

  Future<void> createUpdateMedicalRecordInterpreters(FormGroup control) async {
    medicalRecordInterpreters.value = const AsyncData(loading: true);
    MedicalRecordInterpreterRequest request = MedicalRecordInterpreterRequest(
      requiredOrUnnnecessary:
          control.control('requiredOrUnnnecessary').value == '要' ? true : false,
      interpreter: control.control('interpreter').value,
      medicalRecord: medicalRecordId.value.requireData,
    );

    if (control.control('_id').value != null) {
      await updateMedicalRecordInterpreters(
          control.control('_id').value, request);
    } else {
      await postMedicalRecordInterpreters(request);
    }
  }

  ValueNotifier<AsyncData<MedicalRecordTravelGroup>> medicalRecordTravelGroups =
      ValueNotifier(
    const AsyncData(),
  );

  Future<void> getMedicalRecordTravelGroups(
      {required String medicalRecordId, required FormGroup formGroup}) async {
    try {
      medicalRecordTravelGroups.value = const AsyncData(loading: true);

      var result =
          await patientRepository.medicalRecordTravelGroups(medicalRecordId);
      medicalRecordTravelGroups.value = AsyncData(data: result);
      insertMedicalRecordTravelGroups(
          data: result,
          formGroup: formGroup.control('travelGroup') as FormGroup);
    } catch (e) {
      logger.d(e);
      medicalRecordTravelGroups.value = AsyncData(error: e);
    }
  }

  void insertMedicalRecordTravelGroups(
      {MedicalRecordTravelGroup? data, required FormGroup formGroup}) {
    formGroup.control('_id').value = data?.id;
    formGroup.control('toGroupLeader').value = data?.toGroupLeader;

    final type = formGroup.control('travelGroup') as FormArray;
    type.clear();
    data?.travelGroup?.forEach((element) {
      type.add(
        FormGroup({
          'name': FormControl<String>(value: element),
        }),
      );
    });

    if (data?.travelGroup == null || data?.travelGroup?.isEmpty == true) {
      type.add(
        FormGroup({
          'name': FormControl<String>(),
        }),
      );
    }
  }

  Future<void> createUpdateMedicalRecordTravelGroups(FormGroup control) async {
    medicalRecordTravelGroups.value = const AsyncData(loading: true);
    List<String?> type = [];

    if (control.control('travelGroup').value != null) {
      print("test ${control.control('travelGroup').value}");
      for (var i = 0;
          i < (control.control('travelGroup').value as List<dynamic>).length;
          i++) {
        if ((control.control('travelGroup').value as List<dynamic>)[i]
                    ['name'] !=
                null ||
            (control.control('travelGroup').value as List<dynamic>)[i]
                    ['name'] !=
                '') {
          print(
              "test ${(control.control('travelGroup').value as List<dynamic>)[i]['name']}");
          type.add((control.control('travelGroup').value as List<dynamic>)[i]
              ['name']);
        }
      }
    }

    print('test $type');

    MedicalRecordTravelGroupRequest request = MedicalRecordTravelGroupRequest(
      toGroupLeader: control.control('toGroupLeader').value ?? false,
      travelGroup: type.isEmpty ? null : type,
      medicalRecord: medicalRecordId.value.requireData,
    );
    try {
      var result =
          await patientRepository.postMedicalRecordTravelGroup(request);
      medicalRecordTravelGroups.value = AsyncData(data: result);
    } catch (e) {
      logger.d(e);
      medicalRecordTravelGroups.value = AsyncData(error: e);
    }
  }

//
  Future<void> createUpdateMedicalRecordCompanions(FormGroup form) async {
    try {
      medicalRecordCompanions.value =
          medicalRecordCompanions.value.copyWith(loading: true);

      for (var element in form.control('MEDICAL_RECORD_Companion').value) {
        List<String?>? chatToolLink = [];
        if (element['chatToolLink'] != null) {
          for (var i = 0;
              i < (element['chatToolLink'] as List<dynamic>).length;
              i++) {
            if ((element['chatToolLink'] as List<dynamic>)[i]['chatToolLink'] !=
                    null ||
                (element['chatToolLink'] as List<dynamic>)[i]['chatToolLink'] !=
                    '') {
              chatToolLink.add((element['chatToolLink'] as List<dynamic>)[i]
                  ['chatToolLink']);
            }
          }
        }

        String? file;
        if (element['chatQrImage'] != null) {
          FileSelect docFile = element['chatQrImage'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                base64Image,
                docFile.filename!,
              );
              file = fileData.filename;
            } catch (e) {
              logger.e(e);
            }
          } else {
            file = docFile.url;
          }
        }

        MedicalRecordCompanionRequest request = MedicalRecordCompanionRequest(
          leader: element['leader'],
          remarks: element['remarks'],
          familyNameRomanized: element['familyNameRomanized'],
          middleNameRomanized: element['middleNameRomanized'],
          firstNameRomanized: element['firstNameRomanized'],
          familyNameChineseOrVietnamese:
              element['familyNameChineseOrVietnamese'],
          middleNameChineseOrVietnamese:
              element['middleNameChineseOrVietnamese'],
          firstNameChineseOrVietnamese: element['firstNameChineseOrVietnamese'],
          familyNameJapaneseForChinese: element['familyNameJapaneseForChinese'],
          middleNameJapaneseForChinese: element['middleNameJapaneseForChinese'],
          firstNameJapaneseForChinese: element['firstNameJapaneseForChinese'],
          familyNameJapaneseForNonChinese:
              element['familyNameJapaneseForNonChinese'],
          middleNameJapaneseForNonChinese:
              element['middleNameJapaneseForNonChinese'],
          firstNameJapaneseForNonChinese:
              element['firstNameJapaneseForNonChinese'],
          nationality: element['nationality'],
          relationship: element['relationship'],
          dateOfBirth: element['dateOfBirth'],
          age: element['age'],
          gender: element['gender'],
          mobileNumber: element['mobileNumber'],
          email: element['email'],
          chatToolLink: chatToolLink,
          chatQrImage: file,
          passportNumber: element['passportNumber'],
          issueDate: element['issueDate'],
          expirationDate: element['expirationDate'],
          visaType: element['visaType'],
          medicalRecord: medicalRecordId.value.requireData,
        );

        if (element['_id'] != null) {
          await updateMedicalRecordCompanions(element['_id'], request);
        } else {
          await postMedicalRecordCompanions(request);
        }
      }

      medicalRecordCompanions.value =
          medicalRecordCompanions.value.copyWith(loading: false);
    } catch (e) {
      logger.d(e);
      medicalRecordCompanions.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<bool>> isClosed = ValueNotifier(const AsyncData());

  Future<void> closePatientAccount() async {
    isClosed.value = const AsyncData(loading: true);
    try {
      await patientRepository
          .closePatientAccount(patientData.value.requireData.id);
      isClosed.value = const AsyncData(data: true);
    } catch (e) {
      logger.d(e);
      isClosed.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<bool>> deletePatient =
      ValueNotifier(const AsyncData());

  Future<void> deletePatientData() async {
    try {
      deletePatient.value = const AsyncData(loading: true);
      await patientRepository.deletePatient(patientData.value.requireData.id);
      deletePatient.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      deletePatient.value = AsyncData(error: e);
    }
  }
}
