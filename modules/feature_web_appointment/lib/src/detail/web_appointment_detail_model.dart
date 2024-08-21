import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_web_appointment/data_web_appointment.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/src/models/models.dart';

import 'web_appointment_detail_form.dart';

@injectable
class WebAppointmentDetailModel {
  WebAppointmentDetailModel({
    required this.repository,
  });

  final WebAppointmentRepository repository;
  FormGroup formGroup = formWebAppointment();

  ValueNotifier<AsyncData<Patient>> patient = ValueNotifier(const AsyncData());

  void getPatientById(String id) async {
    try {
      patient.value = const AsyncData(loading: true);
      final result = await repository.webBookingGetPatientById(id);
      patient.value = AsyncData(data: result);
      if (patient.value.hasData) {
        formGroup.control('patientName').value =
            '${patient.value.requireData.firstNameRomanized} ${patient.value.requireData.middleNameRomanized} ${patient.value.requireData.familyNameRomanized}';
        getBookingByPatientId(patient.value.requireData.id);
      }
    } catch (e) {
      logger.e(e);
      patient.value = AsyncData(error: e);
    }
  }

  void searchPatient({String? search}) async {
    try {
      patient.value = const AsyncData(loading: true);
      final result = await repository.webBookingSearchPatients(search: search);
      patient.value = AsyncData(data: result.first);
      if (patient.value.hasData) {
        getBookingByPatientId(patient.value.requireData.id);
      }
    } catch (e) {
      logger.e(e);
      patient.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<TreamentResponce>> bookingByPatient =
      ValueNotifier(const AsyncData());

  void getBookingByPatientId(String patientId) async {
    try {
      bookingByPatient.value = const AsyncData(loading: true);
      final result = await repository.getBookingByPatientId(patientId);
      bookingByPatient.value = AsyncData(data: result);

      if (bookingByPatient.value.hasData) {
        formGroup.control('preferredDate1').value =
            bookingByPatient.value.requireData.desiredDate1;
        formGroup.control('preferredDate2').value =
            bookingByPatient.value.requireData.desiredDate2;
        formGroup.control('preferredDate3').value =
            bookingByPatient.value.requireData.desiredDate3;
        var noDesiredDate =
            bookingByPatient.value.requireData.desiredDate1 == null &&
                bookingByPatient.value.requireData.desiredDate2 == null &&
                bookingByPatient.value.requireData.desiredDate3 == null;
        formGroup.control('noDesiredDate').value = noDesiredDate;
        formGroup.control('remarks').value =
            bookingByPatient.value.requireData.reason;
      } else {
        formGroup.control('noDesiredDate').value = true;
      }
    } catch (e) {
      logger.e(e);
      formGroup.control('noDesiredDate').value = true;
      bookingByPatient.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<BasicInformationHospitalResponse>> hospital =
      ValueNotifier(const AsyncData());

  void getHospitalById(String id) async {
    try {
      hospital.value = const AsyncData(loading: true);
      final result = await repository.webBookingGetHospitalById(id);
      hospital.value = AsyncData(data: result);

      if (hospital.value.hasData) {
        formGroup.control('medicalInstitutionName').value =
            hospital.value.requireData.hospitalNameKatakana;
        insertHospitalSchedule();
        getDoctorsByHospitalId(hospital.value.requireData.id);
      }
    } catch (e) {
      logger.e(e);
      hospital.value = AsyncData(error: e);
    }
  }

  void searchHospital({String? search}) async {
    try {
      hospital.value = const AsyncData(loading: true);
      final result = await repository.webBookingSearchHospital(search: search);
      hospital.value = AsyncData(data: result.first);

      if (hospital.value.hasData) {
        insertHospitalSchedule();
        getDoctorsByHospitalId(hospital.value.requireData.id);
      }
    } catch (e) {
      logger.e(e);
      hospital.value = AsyncData(error: e);
    }
  }

  void insertHospitalSchedule() {
    var data = hospital.value.requireData;
    formGroup.control('medicalInstitutionName').value =
        data.hospitalNameKatakana;
    formGroup.control('department1').value = data.department1;
    formGroup.control('department2').value = data.department2;
    formGroup.control('shift1').value = data.shift1;
    formGroup.control('shift2').value = data.shift2;
    formGroup.control('shift1Mon').value = data.shift1Mon;
    formGroup.control('shift1Tue').value = data.shift1Tue;
    formGroup.control('shift1Wed').value = data.shift1Wed;
    formGroup.control('shift1Thu').value = data.shift1Thu;
    formGroup.control('shift1Fri').value = data.shift1Fri;
    formGroup.control('shift1Sat').value = data.shift1Sat;
    formGroup.control('shift1Sun').value = data.shift1Sun;
    formGroup.control('shift2Mon').value = data.shift2Mon;
    formGroup.control('shift2Tue').value = data.shift2Tue;
    formGroup.control('shift2Wed').value = data.shift2Wed;
    formGroup.control('shift2Thu').value = data.shift2Thu;
    formGroup.control('shift2Fri').value = data.shift2Fri;
    formGroup.control('shift2Sat').value = data.shift2Sat;
    formGroup.control('shift2Sun').value = data.shift2Sun;
  }

  ValueNotifier<AsyncData<List<DoctorProfileHospitalResponse>>> doctors =
      ValueNotifier(const AsyncData());

  void getDoctorsByHospitalId(String hospitalId) async {
    try {
      doctors.value = const AsyncData(loading: true);
      final result = await repository.getDoctorsByHospitalId(hospitalId);
      doctors.value = AsyncData(data: result);
      if (webBooking.value.hasData && doctors.value.hasData) {
        doctorSelected.value = AsyncData(
            data: doctors.value.requireData.firstWhere((element) =>
                element.id == webBooking.value.requireData.doctor?.id));

        if (doctorSelected.value.hasData) {
          formGroup.control('doctorName').value =
              doctorSelected.value.requireData;
        }
      }
    } catch (e) {
      logger.e(e);
      doctors.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<DoctorProfileHospitalResponse>> doctorSelected =
      ValueNotifier(const AsyncData());

  void selectDoctor(DoctorProfileHospitalResponse doctor) {
    doctorSelected.value = AsyncData(data: doctor);
  }

  ValueNotifier<AsyncData<WebBookingMedicalRecordResponse>> webBooking =
      ValueNotifier(const AsyncData());

  void getReservationById({String? id}) async {
    try {
      if (id != null) {
        webBooking.value = const AsyncData(loading: true);
        final result = await repository.webBookingGetReservationById(id);
        webBooking.value = AsyncData(data: result);

        if (webBooking.value.hasData) {
          insertWebBooking();
          formGroup.control('testCallDate').value =
              webBooking.value.requireData.testCallDate;
          formGroup.control('testCallTime').value =
              webBooking.value.requireData.testCallTime;
          getPatientById(webBooking.value.requireData.patient?.id ?? '');
          getHospitalById(webBooking.value.requireData.hospital?.id ?? '');
        }
      }
    } catch (e) {
      logger.e(e);
      webBooking.value = AsyncData(error: e);
    }
  }

  void insertWebBooking() {
    var data = webBooking.value.requireData;

    FormArray candidateDate = formGroup.control('candidateDate') as FormArray;

    if (data.proposedDates != null && data.proposedDates!.isNotEmpty) {
      candidateDate.clear(updateParent: true);
      data.proposedDates?.map((e) {
        candidateDate.add(FormGroup({
          'id': FormControl<String>(value: e.id),
          'preferredDate': FormControl<DateTime>(value: e.proposedDate),
          'choice': FormControl<String>(value: e.selectMorningAfternoonAllDay),
          'timePeriodFrom': FormControl<String>(value: e.timeZoneFrom),
          'timePeriodTo': FormControl<String>(value: e.timeZoneTo),
        }));
      }).toList();
    }
  }

  ValueNotifier<AsyncData<WebBookingMedicalRecordResponse>> submit =
      ValueNotifier(const AsyncData());

  void submitReservation(WebBookingMedicalRecordRequest request) async {
    try {
      submit.value = const AsyncData(loading: true);
      final result = await repository.webBookingPostReservation(request);
      submit.value = AsyncData(data: result);
      webBooking.value = AsyncData(data: result);
    } catch (e) {
      logger.e(e);
      submit.value = AsyncData(error: e);
    }
  }

  void updateReservation(
      String reservationId, WebBookingMedicalRecordRequest request) async {
    try {
      submit.value = const AsyncData(loading: true);
      final result =
          await repository.webBookingPutReservation(reservationId, request);
      submit.value = AsyncData(data: result);
      webBooking.value = AsyncData(data: result);
      formGroup.control('message').value = null;
    } catch (e) {
      logger.e(e);
      submit.value = AsyncData(error: e);
    }
  }

  void submitData() {
    if (webBooking.value.hasData) {
      List<ProposedDate> proposedDates = [];

      formGroup.control('candidateDate').value.forEach((element) {
        proposedDates.add(ProposedDate(
          id: element['id'],
          proposedDate: element['preferredDate'],
          selectMorningAfternoonAllDay: element['choice'],
          timeZoneFrom: element['timePeriodFrom'],
          timeZoneTo: element['timePeriodTo'],
        ));
      });

      List<MessageFrom> messageFrom = webBooking.value.data!.messageFrom ?? [];

      if (formGroup.control('message').value != null) {
        messageFrom.add(MessageFrom(
          message: formGroup.control('message').value,
          from: 'Admin',
        ));
      }

      var request = WebBookingMedicalRecordRequest(
        patientName:
            '${patient.value.data?.firstNameRomanized ?? '-'} ${patient.value.data?.middleNameRomanized ?? '-'} ${patient.value.data?.familyNameRomanized ?? '-'}',
        patient: patient.value.data?.id,
        hospital: hospital.value.data?.id,
        doctor: doctorSelected.value.data?.id,
        proposedDates: proposedDates,
        messageFrom: messageFrom,
        isClosed: webBooking.value.data?.isClosed,
        timeZoneConfirmationTo: webBooking.value.data?.timeZoneConfirmationTo,
        timeZoneConfirmationFrom:
            webBooking.value.data?.timeZoneConfirmationFrom,
        reservationConfirmationDate:
            webBooking.value.data?.reservationConfirmationDate,
        testCallDate: formGroup.control('testCallDate').value,
        testCallTime: formGroup.control('testCallTime').value,
      );
      updateReservation(webBooking.value.requireData.id, request);
    } else {
      List<ProposedDate> proposedDates = [];

      formGroup.control('candidateDate').value.forEach((element) {
        proposedDates.add(ProposedDate(
          id: element['id'],
          proposedDate: element['preferredDate'],
          selectMorningAfternoonAllDay: element['choice'],
          timeZoneFrom: element['timePeriodFrom'],
          timeZoneTo: element['timePeriodTo'],
        ));
      });
      List<MessageFrom> messageFrom = [];

      if (formGroup.control('message').value != null) {
        messageFrom.add(MessageFrom(
          message: formGroup.control('message').value,
          from: 'Admin',
        ));
      }
      var request = WebBookingMedicalRecordRequest(
        patientName:
            '${patient.value.data?.firstNameRomanized ?? '-'} ${patient.value.data?.middleNameRomanized ?? '-'} ${patient.value.data?.familyNameRomanized ?? '-'}',
        patient: patient.value.data?.id,
        hospital: hospital.value.data?.id,
        doctor: doctorSelected.value.data?.id,
        proposedDates: proposedDates,
        messageFrom: messageFrom,
        testCallDate: formGroup.control('testCallDate').value,
        testCallTime: formGroup.control('testCallTime').value,
      );
      submitReservation(request);
    }
  }

  ValueNotifier<AsyncData<List<WebBookingMedicalRecordResponse>>> webBookings =
      ValueNotifier(const AsyncData());

  void getReservationAll({
    String? hospitalId,
    String? patientId,
  }) async {
    try {
      webBookings.value = const AsyncData(loading: true);
      final result = await repository.webBookingGetReservationAll(
        hospitalId: hospitalId,
        patientId: patientId,
      );
      webBookings.value = AsyncData(data: result);
    } catch (e) {
      logger.e(e);
      webBookings.value = AsyncData(error: e);
    }
  }
}
