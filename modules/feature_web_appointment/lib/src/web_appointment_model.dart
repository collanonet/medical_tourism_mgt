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

      // Fetch ALL data by passing null to all parameters
      // This circumvents the backend returning empty lists when partial search terms are sent
      final result = await repository.webBookingGetReservationAll(
        hospitalName: null,
        doctor_name: null,
        reservation_date_from: null,
        reservation_date_to: null,
        inquiryInProgress: null,
        reservationConfirmed: null,
      );

      // Client-side filtering as fallback
      final filteredResult = result.where((item) {
        // Hospital Name Filter
        if (hospitalName != null && hospitalName.isNotEmpty) {
          final name = item.hospital?.hospitalNameChinese ?? '';
          if (!name.contains(hospitalName)) {
            return false;
          }
        }

        // Doctor Name Filter
        if (doctor_name != null && doctor_name.isNotEmpty) {
          final doctor = item.doctor;
          final name = doctor?.name ?? '';
          final nameKanji = doctor?.nameKanji ?? '';
          final nameKana = doctor?.nameKana ?? '';
          if (!name.contains(doctor_name) &&
              !nameKanji.contains(doctor_name) &&
              !nameKana.contains(doctor_name)) {
            return false;
          }
        }

        // Date Range Filter
        if (reservation_date_from != null && reservation_date_to != null) {
          final proposedDates = item.proposedDates ?? [];
          final hasDateInRange = proposedDates.any((date) {
            final d = date.proposedDate;
            if (d == null) return false;
            // Normalize dates to remove time component for comparison
            final start = DateTime(reservation_date_from.year,
                reservation_date_from.month, reservation_date_from.day);
            final end = DateTime(reservation_date_to.year,
                reservation_date_to.month, reservation_date_to.day);
            final target = DateTime(d.year, d.month, d.day);
            return (target.isAtSameMomentAs(start) || target.isAfter(start)) &&
                (target.isAtSameMomentAs(end) || target.isBefore(end));
          });
          if (!hasDateInRange) {
            return false;
          }
        }

        // Status Filter
        // If both are checked or both are unchecked, show all (or handle logic as needed).
        // Assuming strict filtering if one is checked.
        if (inquiryInProgress == true || reservationConfirmed == true) {
           // Inquiry In Progress: reservationConfirmationDate is null
           final isInquiry = item.reservationConfirmationDate == null;
           // Reservation Confirmed: reservationConfirmationDate is NOT null
           final isConfirmed = item.reservationConfirmationDate != null;

           if (inquiryInProgress == true && reservationConfirmed == true) {
             // Show both
             if (!isInquiry && !isConfirmed) return false; // Should not happen logically, but safe
           } else if (inquiryInProgress == true) {
             if (!isInquiry) return false;
           } else if (reservationConfirmed == true) {
             if (!isConfirmed) return false;
           }
        }

        return true;
      }).toList();

      webBookingAdmin.value = AsyncData(data: filteredResult);
    } catch (e) {
      webBookingAdmin.value = AsyncData(error: e);
    }
  }
}
