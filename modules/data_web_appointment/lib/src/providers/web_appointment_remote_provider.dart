import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';

@injectable
class WebAppointmentRemoteProvider {
  WebAppointmentRemoteProvider({
    required this.apiService,
  });

  final ApiService apiService;

  Future<TreamentResponce> getInfoMedicalExamination(
      String patientId,
      ) async {
    return apiService.getInfoMedicalExamination(
      patientId,
    );
  }

  Future<List<WebBookingMedicalRecord>> getWebBookingAdmin() async {
    return apiService.getWebBookingAdmin();
  }

  Future<WebBookingMedicalRecord> getWebBookingAdminById(String id) async {
    return apiService.getWebBookingAdminById(id);
  }

  Future<WebBookingMedicalRecord> putWebBookingAdmin(String id,
      WebBookingMedicalRecordRequest webBookingMedicalRecordRequest) async {
    return apiService.putWebBookingAdmin(id, webBookingMedicalRecordRequest);
  }
}
