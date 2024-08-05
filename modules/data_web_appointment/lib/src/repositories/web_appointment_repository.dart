import 'package:core_network/core_network.dart';

abstract class WebAppointmentRepository {
  Future<TreamentResponce> getInfoMedicalExamination(
      String patientId,
      );

  Future<List<WebBookingMedicalRecord>> getWebBookingAdmin();

  Future<WebBookingMedicalRecord> getWebBookingAdminById(String id);

  Future<WebBookingMedicalRecord> putWebBookingAdmin(String id,
      WebBookingMedicalRecordRequest webBookingMedicalRecordRequest);
}