// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_web_appointment/data_web_appointment.dart';
import 'package:injectable/injectable.dart';

@injectable
class WebAppointmentModel {
  WebAppointmentModel({
    required this.repository,
  });

  final WebAppointmentRepository repository;

  ValueNotifier<AsyncData<List<WebBookingMedicalRecordResponse>>>
      webBookingAdmin = ValueNotifier(const AsyncData());

  void getWebBookingAdmin({
    String? hospitalName,
    String? doctor_name,
    DateTime? reservation_date_from,
    DateTime? reservation_date_to,
    bool? inquiryInProgress,
    bool? reservationConfirmed,
  }) async {
    try {
      webBookingAdmin.value = const AsyncData(loading: true);

      final result = await repository.webBookingGetReservationAll(
        hospitalName: hospitalName,
        doctor_name: doctor_name,
        reservation_date_from: reservation_date_from,
        reservation_date_to: reservation_date_to,
        inquiryInProgress: inquiryInProgress,
        reservationConfirmed: reservationConfirmed,
      );
      webBookingAdmin.value = AsyncData(data: result);
    } catch (e) {
      webBookingAdmin.value = AsyncData(error: e);
    }
  }
}
