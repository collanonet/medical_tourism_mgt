import 'package:core_network/src/entities/application_treament_responce.dart';
import 'package:core_network/src/entities/basic_information_hospital_response.dart';
import 'package:core_network/src/entities/doctor_profile_hospital_response.dart';
import 'package:core_network/src/entities/patient.dart';
import 'package:core_network/src/entities/web_booking_medical_record_request.dart';
import 'package:core_network/src/entities/web_booking_medical_record_response.dart';
import 'package:injectable/injectable.dart';

import '../providers/web_appointment_remote_provider.dart';
import 'web_appointment_repository.dart';

@Injectable(as: WebAppointmentRepository)
class WebAppointmentRepositoryIml extends WebAppointmentRepository {
  WebAppointmentRepositoryIml({
    required this.remote,
  });

  final WebAppointmentRemoteProvider remote;

  @override
  Future<TreamentResponce> getBookingByPatientId(String patientId) {
    return remote.getBookingByPatientId(patientId);
  }

  @override
  Future<List<DoctorProfileHospitalResponse>> getDoctorsByHospitalId(
      String hospitalId) {
    return remote.getDoctorsByHospitalId(hospitalId);
  }

  @override
  Future<void> webBookingDeleteReservation(String reservationId) {
    return remote.webBookingDeleteReservation(reservationId);
  }

  @override
  Future<BasicInformationHospitalResponse> webBookingGetHospitalById(
      String id) {
    return remote.webBookingGetHospitalById(id);
  }

  @override
  Future<Patient> webBookingGetPatientById(String id) {
    return remote.webBookingGetPatientById(id);
  }

  @override
  Future<List<WebBookingMedicalRecordResponse>> webBookingGetReservationAll({
    String? hospitalName,
    String? doctor_name,
    DateTime? reservation_date_from,
    DateTime? reservation_date_to,
    bool? inquiryInProgress,
    bool? reservationConfirmed,
  }) {
    return remote.webBookingGetReservationAll(
      hospitalName: hospitalName,
      doctor_name: doctor_name,
      reservation_date_from: reservation_date_from,
      reservation_date_to: reservation_date_to,
      inquiryInProgress: inquiryInProgress,
      reservationConfirmed: reservationConfirmed,
    );
  }

  @override
  Future<WebBookingMedicalRecordResponse> webBookingGetReservationById(
      String id) {
    return remote.webBookingGetReservationById(id);
  }

  @override
  Future<WebBookingMedicalRecordResponse> webBookingPostReservation(
      WebBookingMedicalRecordRequest request) {
    return remote.webBookingPostReservation(request);
  }

  @override
  Future<WebBookingMedicalRecordResponse> webBookingPutReservation(
      String reservationId, WebBookingMedicalRecordRequest request) {
    return remote.webBookingPutReservation(reservationId, request);
  }

  @override
  Future<List<BasicInformationHospitalResponse>> webBookingSearchHospital(
      {String? search}) {
    return remote.webBookingSearchHospital(search: search);
  }

  @override
  Future<List<Patient>> webBookingSearchPatients({String? search}) {
    return remote.webBookingSearchPatients(search: search);
  }
}
