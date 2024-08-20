import 'package:data_web_appointment/data_web_appointment.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';

@injectable
class WebAppointmentModel {
  WebAppointmentModel({
    required this.repository,
  });

  final WebAppointmentRepository repository;

  ValueNotifier<AsyncData<List<WebBookingMedicalRecordResponse>>> webBookingAdmin =
      ValueNotifier(const AsyncData());

  void getWebBookingAdmin() async {
    try {
      webBookingAdmin.value = const AsyncData(loading: true);

      final result = await repository.webBookingGetReservationAll();
      webBookingAdmin.value = AsyncData(data: result);
    } catch (e) {
      webBookingAdmin.value = AsyncData(error: e);
    }
  }
}
