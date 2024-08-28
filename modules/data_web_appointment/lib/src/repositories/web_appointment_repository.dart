import 'package:core_network/core_network.dart';

abstract class WebAppointmentRepository {
  Future<BasicInformationHospitalResponse> webBookingGetHospitalById(String id);

  Future<List<BasicInformationHospitalResponse>> webBookingSearchHospital(
      {String? search});

  Future<List<DoctorProfileHospitalResponse>> getDoctorsByHospitalId(
      String hospitalId);

  Future<Patient> webBookingGetPatientById(String id);

  Future<List<Patient>> webBookingSearchPatients({String? search});

  Future<TreamentResponce> getBookingByPatientId(String patientId);

  Future<List<WebBookingMedicalRecordResponse>> webBookingGetReservationAll({
    String? hospitalName,
    String? doctor_name,
    DateTime? reservation_date_from,
    DateTime? reservation_date_to,
    bool? inquiryInProgress,
    bool? reservationConfirmed,
    String? hospitalId,
    String? patientId,
  });

  Future<WebBookingMedicalRecordResponse> webBookingGetReservationById(
      String id);

  Future<WebBookingMedicalRecordResponse> webBookingPostReservation(
      WebBookingMedicalRecordRequest request);

  Future<WebBookingMedicalRecordResponse> webBookingPutReservation(
      String reservationId, WebBookingMedicalRecordRequest request);

  Future<void> webBookingDeleteReservation(String reservationId);

  Future<TreamentResponce> updateBooking(String treatmentId, TreamentRequest treatmentRequest);

}
