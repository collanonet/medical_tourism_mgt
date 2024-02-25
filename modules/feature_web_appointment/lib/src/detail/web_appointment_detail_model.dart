import 'package:core_network/core_network.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_web_appointment/data_web_appointment.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/src/models/models.dart';

@injectable
class WebAppointmentDetailModel {
  WebAppointmentDetailModel({
    required this.repository,
  });

  final WebAppointmentRepository repository;

  ValueNotifier<AsyncData<WebBookingMedicalRecord>> webBookingAdmin =
      ValueNotifier(const AsyncData());
  ValueNotifier<AsyncData<WebBookingMedicalRecord>> updateWebBookingAdminData =
      ValueNotifier(const AsyncData());

  void getWebBookingAdmin(String id, FormGroup formGroup) async {
    try {
      webBookingAdmin.value = const AsyncData(loading: true);

      final result = await repository.getWebBookingAdminById(id);
      webBookingAdmin.value = AsyncData(data: result);
      insertDataToForm(formGroup, result);
    } catch (e) {
      logger.e(e);
      webBookingAdmin.value = AsyncData(error: e);
    }
  }

  void insertDataToForm(FormGroup formGroup, WebBookingMedicalRecord result) {
    logger.d('result: $result');
    formGroup.control('patientName').value =
        result.patient.firstNameJapaneseForNonChinese;
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

  void updateWebBookingAdmin(FormGroup formGroup) async {
    try {
      webBookingAdmin.value = webBookingAdmin.value.copyWith(loading: true);
      updateWebBookingAdminData.value = const AsyncData(loading: true);
      List<BookingDateRequest> candidateDate = [];
      await formGroup.control('candidateDate').value.forEach((element) async {
        candidateDate.add(BookingDateRequest(
          preferredDate: element['preferredDate'],
          choice: element['choice'],
          timePeriodFrom: element['timePeriodFrom'],
          timePeriodTo: element['timePeriodTo'],
          medicalRecord: webBookingAdmin.value.requireData.medicalRecord,
        ));
      });
      final webBookingMedicalRecord = WebBookingMedicalRecordRequest(
        medicalRecord: webBookingAdmin.value.requireData.medicalRecord,
        patient: webBookingAdmin.value.requireData.patient.id,
        medicalInstitutionName:
            formGroup.control('medicalInstitutionName').value,
        doctorName: formGroup.control('doctorName').value,
        candidateDate: candidateDate,
        message: formGroup.control('message').value,
        testCallDate: formGroup.control('testCallDate').value.toString(),
        testCallTime: formGroup.control('testCallTime').value,
      );

      final result = await repository.putWebBookingAdmin(
          webBookingAdmin.value.requireData.id, webBookingMedicalRecord);
      webBookingAdmin.value = AsyncData(data: result);
      updateWebBookingAdminData.value = AsyncData(data: result);
    } catch (e) {
      logger.e(e);
      updateWebBookingAdminData.value = AsyncData(error: e);
    }
  }
}
