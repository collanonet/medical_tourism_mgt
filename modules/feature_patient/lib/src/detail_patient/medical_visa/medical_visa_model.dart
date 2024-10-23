// Flutter imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class MedicalVisaModel with ChangeNotifier {
  MedicalVisaModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  late Patient _patient;

  Patient get patient => _patient;

  Future<void> initialData({Patient? patient, String? id}) async {
    notifyListeners();
  }

  Future<void> fetchData(FormGroup formGroup) async {
    try {
      await fetchMedicalVisaPersonal(
          formGroup.control('personal') as FormArray);
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<List<MedicalVisaPersonalResponse>>> personalData =
      ValueNotifier(const AsyncData());
  Future<void> fetchMedicalVisaPersonal(FormArray formArray) async {
    try {
      personalData.value = const AsyncData(loading: true);
      final response = await patientRepository.getMedicalVisaPersonal();
      insertPersonal(formArray, response);
      personalData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      personalData.value = AsyncData(error: e);
    }
  }

  void insertPersonal(
      FormArray formArray, List<MedicalVisaPersonalResponse> elements) {
    if (elements.isNotEmpty) {
      formArray.clear();
      for (var element in elements) {
        formArray.add(
          FormGroup(
            {
              'medicalVisa': FormControl<String>(value: element.medicalVisa),
              'applicationDate': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
                value: element.applicationDate,
              ),
              'issueDate': FormControl<DateTime>(validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ], value: element.issueDate),
              'expirationDate': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
                value: element.expirationDate,
              ),
              'accompanyingPersonsNumber':
                  FormControl<String>(value: element.accompanyingPersonsNumber),
              'visaIssuingOverseasEstablishments': FormControl<String>(
                  value: element.visaIssuingOverseasEstablishments),
              'remarks': FormControl<String>(value: element.remarks),
              'paymentStatus':
                  FormControl<String>(value: element.paymentStatus),
            },
          ),
        );
      }
    }
  }

  ValueNotifier<AsyncData<List<MedicalVisaStayPeriodResponse>>> stayPeriodData =
      ValueNotifier(const AsyncData());
  Future<void> fetchMedicalVisaStayPeriod() async {
    try {
      stayPeriodData.value = const AsyncData(loading: true);
      final response = await patientRepository.getMedicalVisaStayPeriod();
      stayPeriodData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      stayPeriodData.value = AsyncData(error: e);
    }
  }

  void insertStayPeriod(
      FormArray formArray, List<MedicalVisaStayPeriodResponse> elements) {
    try {
      if (elements.isNotEmpty) {
        formArray.clear();
        for (var element in elements) {
          formArray.add(
            FormGroup(
              {
                'stayStartingDatePersonalReference': FormControl<DateTime>(
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                  value: element.stayStartingDatePersonalReference,
                ),
                'stayEndDate': FormControl<DateTime>(
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                  value: element.stayEndDate,
                ),
              },
            ),
          );
        }
      }
    } catch (e) {
      logger.e(e);
    }
  }

  ValueNotifier<AsyncData<bool>> submit = ValueNotifier(const AsyncData());
  Future<void> submitMedicalVisa(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);
      await submitMedicalVisaPersonal(formGroup);
    } catch (e) {
      logger.d(e);
      submit.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<MedicalVisaPersonalResponse>> submitPersonalData =
      ValueNotifier(const AsyncData());
  Future<void> submitMedicalVisaPersonal(FormGroup formGroup) async {
    try {
      submitPersonalData.value = const AsyncData(loading: true);
      await formGroup.control('personal').value.forEach(
        (e) async {
          MedicalVisaPersonalRequest request = MedicalVisaPersonalRequest(
            medicalVisa: e['medicalVisa'],
            applicationDate: e['applicationDate'],
            issueDate: e['issueDate'],
            expirationDate: e['expirationDate'],
            accompanyingPersonsNumber: e['accompanyingPersonsNumber'],
            visaIssuingOverseasEstablishments:
                e['visaIssuingOverseasEstablishments'],
            remarks: e['remarks'],
            paymentStatus: e['paymentStatus'],
          );
          final response =
              await patientRepository.postMedicalVisaPersonal(request);
          submitPersonalData.value = AsyncData(data: response);
        },
      );
    } catch (e) {
      logger.d(e);
      submitPersonalData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<MedicalVisaStayPeriodResponse>> submitStayPeriodData =
      ValueNotifier(const AsyncData());
  Future<void> submitStayPeriod(FormGroup formGroup) async {
    try {
      submitStayPeriodData.value = const AsyncData(loading: true);
      await formGroup.control('stayPeriod').value.forEach(
        (e) async {
          MedicalVisaStayPeriodRequest request = MedicalVisaStayPeriodRequest(
            stayEndDate: e['stayEndDate'],
            stayStartingDatePersonalReference:
                e['stayStartingDatePersonalReference'],
          );
          final response =
              await patientRepository.postMedicalVisaStayPeriod(request);
          submitStayPeriodData.value = AsyncData(data: response);
        },
      );
    } catch (e) {
      logger.e(e);
    }
  }
}
