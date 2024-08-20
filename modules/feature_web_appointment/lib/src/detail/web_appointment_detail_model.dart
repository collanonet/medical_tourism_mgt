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
    } catch (e) {
      logger.e(e);
      patient.value = AsyncData(error: e);
    }
  }

  void searchPatient({String? search}) async {
    try {
      patient.value = const AsyncData(loading: true);
      final result = await repository.webBookingSearchPatients(search: search);
      patient.value = AsyncData(data: result);
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
    } catch (e) {
      logger.e(e);
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
    } catch (e) {
      logger.e(e);
      hospital.value = AsyncData(error: e);
    }
  }

  void searchHospital({String? search}) async {
    try {
      hospital.value = const AsyncData(loading: true);
      final result = await repository.webBookingSearchHospital(search: search);
      hospital.value = AsyncData(data: result);
    } catch (e) {
      logger.e(e);
      hospital.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<List<DoctorProfileHospitalResponse>>> doctors =
      ValueNotifier(const AsyncData());

  void getDoctorsByHospitalId(String hospitalId) async {
    try {
      doctors.value = const AsyncData(loading: true);
      final result = await repository.getDoctorsByHospitalId(hospitalId);
      doctors.value = AsyncData(data: result);
    } catch (e) {
      logger.e(e);
      doctors.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<WebBookingMedicalRecordResponse>> webBooking =
      ValueNotifier(const AsyncData());

  void getReservationById({String? id}) async {
    try {
      if (id != null) {
        webBooking.value = const AsyncData(loading: true);
        final result = await repository.webBookingGetReservationById(id!);
        webBooking.value = AsyncData(data: result);
      }
    } catch (e) {
      logger.e(e);
      webBooking.value = AsyncData(error: e);
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
    } catch (e) {
      logger.e(e);
      submit.value = AsyncData(error: e);
    }
  }

  void submitData() {
    if (webBooking.value.hasData) {
      var request = WebBookingMedicalRecordRequest(
          // medicalRecord: webBooking.value.requireData.medicalRecord,
          // patient: webBooking.value.requireData.patient.id,
          // medicalInstitutionName: form.control('medicalInstitutionName').value,
          // doctorName: form.control('doctorName').value,
          // candidateDate: [],
          // message: form.control('message').value,
          );
      updateReservation(webBooking.value.requireData.id, request);
    } else {
      var request = WebBookingMedicalRecordRequest(
          // medicalRecord: '',
          // patient: patient.value.requireData.id,
          // medicalInstitutionName: form.control('medicalInstitutionName').value,
          // doctorName: form.control('doctorName').value,
          // candidateDate: [],
          // message: form.control('message').value,
          );
      submitReservation(request);
    }
  }
}
