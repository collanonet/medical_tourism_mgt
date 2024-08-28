// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_process_chart/data_process_chart.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProcessChartModel {
  ProcessChartModel({required this.processChartRepository});
  final ProcessChartRepository processChartRepository;

  ValueNotifier<AsyncData<List<DetailItineraryResponse>>> itinerraryData =
      ValueNotifier(const AsyncData<List<DetailItineraryResponse>>(data: []));
  Future<void> fetchItinerary({required String id,String? tourName,String? classification,DateTime? dateFrom,DateTime? dateTo,}) async {
    try {
      itinerraryData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getDetailItinerary(
        id: id,
        tourName: tourName,
        classification: classification,
        dateFrom: dateFrom,
        dateTo: dateTo,
      );
      itinerraryData.value = AsyncData(data: response);
      logger.d(response.toList());
    } catch (e) {
      logger.d(e);
      itinerraryData.value = AsyncData(error: e);
    }
  }

  // ValueNotifier<AsyncData<PatientFilterResponse>> filterPatientData =
  //     ValueNotifier(const AsyncData());
  // Future<void> fetchFilterPatientChart(FormGroup formGroup) async {
  //   try {
  //     filterPatientData.value = const AsyncData(loading: true);
  //     final response = await processChartRepository.getFilterPatientChart();

  //    // insertFilterPatientChart(formGroup, response);
  //   } catch (e) {
  //     filterPatientData.value = AsyncData(error: e);
  //   }
  // }

  // void insertFilterPatientChart(
  //     FormGroup formGroup, PatientFilterResponse? data) {
  //   formGroup.control('patientName').value = data?.patientName;
  //   formGroup.control('visa').value = data?.visa;
  //   formGroup.control('report').value = data?.report;
  //   formGroup.control('subjects_withdrawal').value = data?.subjectsWithdrawal;
  //   formGroup.control('refinement_date').value = data?.refinementDate;
  //   formGroup.control('period_from').value = data?.periodFrom;
  //   formGroup.control('period_to').value = data?.periodTo;
  // }

  // ValueNotifier<AsyncData<PatientFilterResponse>> submitFilterPatientChartData =
  //     ValueNotifier(const AsyncData());
  // Future<void> submitFilterPatientChart(FormGroup formGroup) async {
  //   try {
  //     submitFilterPatientChartData.value = const AsyncData(loading: true);
  //     final response = await processChartRepository
  //         .postFilterpatientChart(PatientFilterRequst(
  //       patientName: formGroup.control('patientName').value,
  //       visa: formGroup.control('visa').value,
  //       report: formGroup.control('report').value,
  //       subjectsWithdrawal: formGroup.control('subjects_withdrawal').value,
  //       refinementDate: formGroup.control('refinement_date').value,
  //       periodFrom: formGroup.control('period_from').value,
  //       periodTo: formGroup.control('period_to').value,
  //     ));
  //     filterPatientData.value = AsyncData(data: response);
  //     submitFilterPatientChartData.value = AsyncData(data: response);
  //   } catch (e) {
  //     submitFilterPatientChartData.value = AsyncData(error: e);
  //   }
  // }
}
