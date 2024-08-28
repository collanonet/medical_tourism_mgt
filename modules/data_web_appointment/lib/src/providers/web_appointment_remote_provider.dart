// Package imports:
import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';

@injectable
class WebAppointmentRemoteProvider {
  WebAppointmentRemoteProvider({
    required this.apiService,
  });

  final ApiService apiService;

  Future<BasicInformationHospitalResponse> webBookingGetHospitalById(
      String id) async {
    return apiService.webBookingGetHospitalById(id);
  }

  Future<List<BasicInformationHospitalResponse>> webBookingSearchHospital(
      {String? search}) async {
    return apiService.webBookingSearchHospital(search: search);
  }

  Future<List<DoctorProfileHospitalResponse>> getDoctorsByHospitalId(
      String hospitalId) async {
    return apiService.getDoctorsByHospitalId(hospitalId);
  }

  Future<Patient> webBookingGetPatientById(String id) async {
    return apiService.webBookingGetPatientById(id);
  }

  Future<List<Patient>> webBookingSearchPatients({String? search}) async {
    return apiService.webBookingSearchPatients(search: search);
  }

  Future<TreamentResponce> getBookingByPatientId(String patientId) async {
    return apiService.getBookingByPatientId(patientId);
  }

  Future<List<WebBookingMedicalRecordResponse>> webBookingGetReservationAll({
    String? hospitalName,
    String? doctor_name,
    DateTime? reservation_date_from,
    DateTime? reservation_date_to,
    bool? inquiryInProgress,
    bool? reservationConfirmed,
    String? hospitalId,
    String? patientId,
  }) async {
    return apiService.webBookingGetReservationAll(
      hospitalName: hospitalName,
      doctor_name: doctor_name,
      reservation_date_from: reservation_date_from,
      reservation_date_to: reservation_date_to,
      inquiryInProgress: inquiryInProgress,
      reservationConfirmed: reservationConfirmed,
      hospitalId: hospitalId,
      patientId: patientId,
    );
  }

  Future<WebBookingMedicalRecordResponse> webBookingGetReservationById(
      String id) async {
    return apiService.webBookingGetReservationById(id);
  }

  Future<WebBookingMedicalRecordResponse> webBookingPostReservation(
      WebBookingMedicalRecordRequest request) async {
    return apiService.webBookingPostReservation(request);
  }

  Future<WebBookingMedicalRecordResponse> webBookingPutReservation(
      String reservationId, WebBookingMedicalRecordRequest request) async {
    return apiService.webBookingPutReservation(reservationId, request);
  }

  Future<void> webBookingDeleteReservation(String reservationId) async {
    return apiService.webBookingDeleteReservation(reservationId);
  }

  Future<TreamentResponce> updateBooking(String treatmentId, TreamentRequest treatmentRequest) {
    return apiService.updateBooking(treatmentId, treatmentRequest);
  }
}
