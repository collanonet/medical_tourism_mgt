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

  Future<BasicInformationHospitalResponse> webBookingSearchHospital(
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

  Future<Patient> webBookingSearchPatients({String? search}) async {
    return apiService.webBookingSearchPatients(search: search);
  }

  Future<TreamentResponce> getBookingByPatientId(String patientId) async {
    return apiService.getBookingByPatientId(patientId);
  }

  Future<List<WebBookingMedicalRecordResponse>> webBookingGetReservationAll(
      {String? search}) async {
    return apiService.webBookingGetReservationAll(search: search);
  }

  Future<WebBookingMedicalRecordResponse> webBookingGetReservationById(
      String id) async {
    return apiService.webBookingGetReservationById(id);
  }

  Future<WebBookingMedicalRecordResponse> webBookingSearchReservation(
      {String? search}) async {
    return apiService.webBookingSearchReservation(search: search);
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
}
