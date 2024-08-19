import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class DetailPatientWebReservationModel {
  DetailPatientWebReservationModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<WebBookingPatientPreferredDate>>
      webBookingPatientPreferredDate =
      ValueNotifier<AsyncData<WebBookingPatientPreferredDate>>(
          const AsyncData());

  ValueNotifier<AsyncData<MedicalRecord>> medicalRecord =
      ValueNotifier<AsyncData<MedicalRecord>>(const AsyncData());

  ValueNotifier<AsyncData<String>> patientIdData =
      ValueNotifier(const AsyncData<String>());

  ValueNotifier<AsyncData<TreamentResponce>> infoWebBookingPatient =
      ValueNotifier(const AsyncData());

  void getInfoMedicalExamination(FormGroup formGroup) async {
    try {
      infoWebBookingPatient.value = const AsyncData(loading: true);
      final response = await patientRepository.getInfoMedicalExamination(
        patientIdData.value.requireData,
      );
      infoWebBookingPatient.value = AsyncData(data: response);
      formGroup.control('preferredDate1').value = response.desiredDate1;
      formGroup.control('preferredDate2').value = response.desiredDate2;
      formGroup.control('preferredDate3').value = response.desiredDate3;
      formGroup.control('noDesiredDate').value =
          response.desiredDate1 == null &&
              response.desiredDate2 == null &&
              response.desiredDate3 == null;
      formGroup.control('remarks').value = response.reason;
      formGroup.control('medicalInstitutionName').value = response.medicalName;
    } catch (e) {
      infoWebBookingPatient.value = AsyncData(error: e);
    }
  }

  void getMedicalRecords(
      {String? patientId, required FormGroup formGroup}) async {
    if (patientId != null) {
      patientIdData.value = AsyncData(data: patientId);
      try {
        medicalRecord.value = const AsyncData(loading: true);

        var result = await patientRepository.medicalRecordsByPatient(patientId);
        logger.d('result: $result');
        medicalRecord.value = AsyncData(data: result.firstOrNull);

        getInfoMedicalExamination(formGroup);
        if (result.isNotEmpty) {
          getWebBookingPatientPreferredDate(formGroup, patientId);
          getWebBookingMedicalRecord(medicalRecord.value.requireData.id);
        }
      } catch (e) {
        logger.e(e);
        medicalRecord.value = AsyncData(error: e);
      }
    }
  }

  getWebBookingPatientPreferredDate(
      FormGroup formGroup, String patientId) async {
    try {
      webBookingPatientPreferredDate.value = const AsyncData(loading: true);
      var result =
          await patientRepository.getWebBookingPatientPreferredDate(patientId);
      logger.d('result: $result');
      webBookingPatientPreferredDate.value = AsyncData(data: result);
      insertDataPatientPreferredDate(result, formGroup);
    } catch (e) {
      logger.e(e);
      webBookingPatientPreferredDate.value = AsyncData(error: e);
    }
  }

  insertDataPatientPreferredDate(
      WebBookingPatientPreferredDate webBookingPatientPreferredDate,
      FormGroup formGroup) {
    formGroup.patchValue({
      'preferredDate1': webBookingPatientPreferredDate.preferredDate1,
      'preferredDate2': webBookingPatientPreferredDate.preferredDate2,
      'preferredDate3': webBookingPatientPreferredDate.preferredDate3,
      'noDesiredDate': webBookingPatientPreferredDate.noDesiredDate,
      'remarks': webBookingPatientPreferredDate.remarks,
    });
  }

  ValueNotifier<AsyncData<List<WebBookingMedicalRecordResponse>>>
      webBookingMedicalRecordData =
      ValueNotifier(const AsyncData<List<WebBookingMedicalRecordResponse>>());

  Future<void> getWebBookingMedicalRecord(String medicalRecord) async {
    try {
      webBookingMedicalRecordData.value = const AsyncData(loading: true);
      final response = await patientRepository.getBookingMedicalRecord(
          medicalRecord: medicalRecord);
      webBookingMedicalRecordData.value = AsyncData(data: response);
    } catch (e) {
      webBookingMedicalRecordData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<WebBookingMedicalRecordResponse>>
      createWebBookingMedicalRecord =
      ValueNotifier(const AsyncData<WebBookingMedicalRecordResponse>());

  Future<void> postBookingMedicalRecord(FormGroup formGroup) async {
    try {
      createWebBookingMedicalRecord.value = const AsyncData(loading: true);

      List<BookingDateRequest> candidateDate = [];
      await formGroup.control('candidateDate').value.forEach((element) async {
        candidateDate.add(BookingDateRequest(
          preferredDate: element['preferredDate'],
          choice: element['choice'],
          timePeriodFrom: element['timePeriodFrom'],
          timePeriodTo: element['timePeriodTo'],
          medicalRecord: medicalRecord.value.requireData.id,
        ));
      });
      final webBookingMedicalRecord = WebBookingMedicalRecordRequest(
        medicalRecord: medicalRecord.value.requireData.id,
        patient: patientIdData.value.requireData,
        medicalInstitutionName:
            formGroup.control('medicalInstitutionName').value,
        doctorName: formGroup.control('doctorName').value,
        candidateDate: candidateDate,
        message: formGroup.control('message').value,
      );

      logger.d('webBookingMedicalRecord: ${webBookingMedicalRecord.toJson()}');

      final response = await patientRepository
          .postBookingMedicalRecord(webBookingMedicalRecord);
      createWebBookingMedicalRecord.value = AsyncData(data: response);
      webBookingMedicalRecordData.value = AsyncData(data: [
        ...webBookingMedicalRecordData.value.data ?? [],
        response,
      ]);
    } catch (e) {
      createWebBookingMedicalRecord.value = AsyncData(error: e);
    }
  }
}
