import 'package:core_network/core_network.dart';

abstract class WebAppointmentRepository {
  Future<BasicInformationHospitalResponse> webBookingGetHospitalById(String id);

  Future<BasicInformationHospitalResponse> webBookingSearchHospital(
      {String? search});

  Future<List<DoctorProfileHospitalResponse>> getDoctorsByHospitalId(
      String hospitalId);

  Future<Patient> webBookingGetPatientById(String id);

  Future<Patient> webBookingSearchPatients({String? search});

  Future<TreamentResponce> getBookingByPatientId(String patientId);

  Future<List<WebBookingMedicalRecordResponse>> webBookingGetReservationAll(
      {String? search});

  Future<WebBookingMedicalRecordResponse> webBookingGetReservationById(
      String id);

  Future<WebBookingMedicalRecordResponse> webBookingSearchReservation(
      {String? search});

  Future<WebBookingMedicalRecordResponse> webBookingPostReservation(
      WebBookingMedicalRecordRequest request);

  Future<WebBookingMedicalRecordResponse> webBookingPutReservation(
      String reservationId, WebBookingMedicalRecordRequest request);

  Future<void> webBookingDeleteReservation(String reservationId);
}
