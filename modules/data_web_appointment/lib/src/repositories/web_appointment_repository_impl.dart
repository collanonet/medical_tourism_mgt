import 'package:core_network/src/entities/type_request.dart';
import 'package:core_network/src/entities/type_response.dart';
import 'package:core_network/src/entities/web_booking_medical_record.dart';
import 'package:core_network/src/entities/web_booking_medical_record_request.dart';
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
  Future<List<WebBookingMedicalRecord>> getWebBookingAdmin() {
    return remote.getWebBookingAdmin();
  }

  @override
  Future<WebBookingMedicalRecord> getWebBookingAdminById(String id) {
    return remote.getWebBookingAdminById(id);
  }

  @override
  Future<WebBookingMedicalRecord> putWebBookingAdmin(String id,
      WebBookingMedicalRecordRequest webBookingMedicalRecordRequest) {
    return remote.putWebBookingAdmin(id, webBookingMedicalRecordRequest);
  }
}
