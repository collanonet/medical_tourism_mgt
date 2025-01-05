// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_report/data_report.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ProspectiveRankModel {
  ProspectiveRankModel({required this.reportRepository});

  final ReportRepository reportRepository;

  ValueNotifier<AsyncData<List<ProspectiveRankResponse>>> prospectiveRankData =
      ValueNotifier(const AsyncData<List<ProspectiveRankResponse>>(data: []));

  Future<void> fetchProsiveRank(FormGroup formGroup) async {
    try {
      prospectiveRankData.value = const AsyncData(loading: true);
      final response = await reportRepository.getProspectiveRank();
      insertProspectiveRank(formGroup, response);
      prospectiveRankData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      prospectiveRankData.value = AsyncData(error: e);
    }
  }

  void insertProspectiveRank(
      FormGroup formGroup, List<ProspectiveRankResponse> data) {
    try {
      if (data.isNotEmpty) {
        var prospectiveArray = formGroup.control('data') as FormArray;
        prospectiveArray.clear();
        for (var item in data) {
          prospectiveArray.add(
            FormGroup({
              '_id': FormControl<String>(value: item.id),
              'prospectRank': FormControl<String>(value: item.prospectRank),
              'shouldItBeIncludedInSalesManagementEstimates': FormControl<bool>(
                  value: item.shouldItBeIncludedInSalesManagementEstimates),
            }),
          );
        }
      }
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<ProspectiveRankResponse>> submit =
      ValueNotifier(const AsyncData());

  Future<void> submitProspectiveRank(FormGroup formGroup) async {
    try {
      List<ProspectiveRankResponse> data = [];
      await formGroup.control('data').value.forEach((element) async {
        submit.value = const AsyncData(loading: true);

        final response = element['_id'] == null
            ? await reportRepository.postProspectiveRank(ProspectiveRankRequest(
                prospectRank: element['prospectRank'],
                shouldItBeIncludedInSalesManagementEstimates:
                    element['shouldItBeIncludedInSalesManagementEstimates']))
            : await reportRepository.putProspectiveRank(
                element['_id'],
                ProspectiveRankRequest(
                    prospectRank: element['prospectRank'],
                    shouldItBeIncludedInSalesManagementEstimates: element[
                        'shouldItBeIncludedInSalesManagementEstimates']));
        submit.value = AsyncData(data: response);
        data.add(response);
      });

      prospectiveRankData.value =
          AsyncData(data: prospectiveRankData.value.data?..addAll(data));
    } catch (e) {
      logger.d(e);
      submit.value = AsyncData(error: e);
    }
  }
}
