import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:data_web_appointment/data_web_appointment.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/src/models/models.dart';

@injectable
class WebAppointmentDetailModel {
  WebAppointmentDetailModel({
    required this.repository,
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  final WebAppointmentRepository repository;

  ValueNotifier<AsyncData<MedicalRecord>> medicalRecord =
      ValueNotifier<AsyncData<MedicalRecord>>(const AsyncData());

  ValueNotifier<AsyncData<String>> patientIdData =
      ValueNotifier(const AsyncData<String>());

  ValueNotifier<AsyncData<WebBookingMedicalRecordResponse>> webBookingAdmin =
      ValueNotifier(const AsyncData());
  ValueNotifier<AsyncData<WebBookingMedicalRecordResponse>>
      updateWebBookingAdminData = ValueNotifier(const AsyncData());

  void getMedicalRecords({String? patientId}) async {
    if (patientId != null) {
      patientIdData.value = AsyncData(data: patientId);
      try {
        medicalRecord.value = const AsyncData(loading: true);

        // var result = await patientRepository.medicalRecordsByPatient(patientId);
        // logger.d('result: $result');
        // medicalRecord.value = AsyncData(data: result.firstOrNull);
      } catch (e) {
        logger.e(e);
        medicalRecord.value = AsyncData(error: e);
      }
    }
  }

  void getWebBookingAdmin({String? id, required FormGroup formGroup}) async {
    if (id != null) {
      try {
        // getMedicalRecords(patientId: id);
        // webBookingAdmin.value = const AsyncData(loading: true);
        //
        // final result = await repository.getWebBookingAdminById(id);
        // webBookingAdmin.value = AsyncData(data: result);
        // insertDataToForm(formGroup, result);
        // getInfoMedicalExamination(formGroup);
      } catch (e) {
        logger.e(e);
        webBookingAdmin.value = AsyncData(error: e);
      }
    }
  }

  void insertDataToForm(FormGroup formGroup, WebBookingMedicalRecord result) {
    logger.d('result: $result');
    formGroup.control('patientName').value =
        '${result.patient.firstNameJapaneseForNonChinese} ${result.patient.middleNameJapaneseForChinese} ${result.patient.familyNameJapaneseForNonChinese}';
    formGroup.control('medicalInstitutionName').value =
        result.medicalInstitutionName;
    formGroup.control('doctorName').value = result.doctorName;

    var formArray = formGroup.control('candidateDate') as FormArray;
    formArray.clear();
    for (var item in result.candidateDate) {
      formArray.add(
        FormGroup({
          'id': FormControl<String>(value: item.id),
          'preferredDate': FormControl<DateTime>(value: item.preferredDate),
          'choice': FormControl<String>(value: item.choice),
          'timePeriodFrom': FormControl<String>(value: item.timePeriodFrom),
          'timePeriodTo': FormControl<String>(value: item.timePeriodTo),
          'medicalRecord': FormControl<String>(value: item.medicalRecord),
        }),
      );
    }
    formGroup.control('message').value = result.message;
    formGroup.control('testCallDate').value = result.testCallDate;
    formGroup.control('testCallTime').value = result.testCallTime;
  }

  ValueNotifier<AsyncData<TreamentResponce>> infoWebBookingPatient =
      ValueNotifier(const AsyncData());

  void getInfoMedicalExamination(FormGroup formGroup) async {
    try {
      // infoWebBookingPatient.value = const AsyncData(loading: true);
      // final response = await repository.getInfoMedicalExamination(
      //   webBookingAdmin.value.requireData.patient.id,
      // );
      // infoWebBookingPatient.value = AsyncData(data: response);
      // formGroup.control('preferredDate1').value = response.desiredDate1;
      // formGroup.control('preferredDate2').value = response.desiredDate2;
      // formGroup.control('preferredDate3').value = response.desiredDate3;
      // formGroup.control('noDesiredDate').value =
      //     response.desiredDate1 == null &&
      //         response.desiredDate2 == null &&
      //         response.desiredDate3 == null;
      // formGroup.control('remarks').value = response.reason;
      // formGroup.control('medicalInstitutionName').value = response.medicalName;
    } catch (e) {
      infoWebBookingPatient.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<WebBookingMedicalRecordResponse>>
      createWebBookingMedicalRecord =
      ValueNotifier(const AsyncData<WebBookingMedicalRecordResponse>());

  // Future<void> postBookingMedicalRecord(FormGroup formGroup) async {
  //   try {
  //     createWebBookingMedicalRecord.value = const AsyncData(loading: true);
  //
  //     List<BookingDateRequest> candidateDate = [];
  //     await formGroup.control('candidateDate').value.forEach((element) async {
  //       candidateDate.add(BookingDateRequest(
  //         preferredDate: element['preferredDate'],
  //         choice: element['choice'],
  //         timePeriodFrom: element['timePeriodFrom'],
  //         timePeriodTo: element['timePeriodTo'],
  //         medicalRecord: medicalRecord.value.requireData.id,
  //       ));
  //     });
  //     final webBookingMedicalRecord = WebBookingMedicalRecordRequest(
  //       medicalRecord: medicalRecord.value.requireData.id,
  //       patient: patientIdData.value.requireData,
  //       medicalInstitutionName:
  //           formGroup.control('medicalInstitutionName').value,
  //       doctorName: formGroup.control('doctorName').value,
  //       candidateDate: candidateDate,
  //       message: formGroup.control('message').value,
  //     );
  //
  //     logger.d('webBookingMedicalRecord: ${webBookingMedicalRecord.toJson()}');
  //
  //     final response = await patientRepository
  //         .postBookingMedicalRecord(webBookingMedicalRecord);
  //     createWebBookingMedicalRecord.value = AsyncData(data: response);
  //   } catch (e) {
  //     createWebBookingMedicalRecord.value = AsyncData(error: e);
  //   }
  // }

  void updateWebBookingAdmin(FormGroup formGroup) async {
    try {
      // webBookingAdmin.value = webBookingAdmin.value.copyWith(loading: true);
      // updateWebBookingAdminData.value = const AsyncData(loading: true);
      // List<BookingDateRequest> candidateDate = [];
      // await formGroup.control('candidateDate').value.forEach((element) async {
      //   candidateDate.add(BookingDateRequest(
      //     preferredDate: element['preferredDate'],
      //     choice: element['choice'],
      //     timePeriodFrom: element['timePeriodFrom'],
      //     timePeriodTo: element['timePeriodTo'],
      //     medicalRecord: webBookingAdmin.value.requireData.medicalRecord,
      //   ));
      // });
      // final webBookingMedicalRecord = WebBookingMedicalRecordRequest(
      //   medicalRecord: webBookingAdmin.value.requireData.medicalRecord,
      //   patient: webBookingAdmin.value.requireData.patient.id,
      //   medicalInstitutionName:
      //       formGroup.control('medicalInstitutionName').value,
      //   doctorName: formGroup.control('doctorName').value,
      //   candidateDate: candidateDate,
      //   message: formGroup.control('message').value,
      // );
      //
      // final result = await repository.putWebBookingAdmin(
      //     webBookingAdmin.value.requireData.id, webBookingMedicalRecord);
      // webBookingAdmin.value = AsyncData(data: result);
      // updateWebBookingAdminData.value = AsyncData(data: result);
    } catch (e) {
      logger.e(e);
      updateWebBookingAdminData.value = AsyncData(error: e);
    }
  }
}
