// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_report/data_report.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class EstimateMasterModel {
  EstimateMasterModel({required this.reportRepository});

  final ReportRepository reportRepository;

  ValueNotifier<AsyncData<List<EstimatemasterReportResponse>>>
      estimateMasterData = ValueNotifier(
          const AsyncData<List<EstimatemasterReportResponse>>(data: []));

  Future<void> fetchEstimateMasterData(FormGroup formGroup) async {
    try {
      estimateMasterData.value = const AsyncData(loading: true);
      final response = await reportRepository.getEstimatemasterReport();
      insertEstimateMaster(formGroup, response);
    } catch (e) {
      estimateMasterData.value = AsyncData(error: e);
    }
  }

  void insertEstimateMaster(
      FormGroup formGroup, List<EstimatemasterReportResponse>? data) {
    if (data!.isNotEmpty) {
      var estimateArray = formGroup.control('type') as FormArray;
      estimateArray.clear();
      for (var element in data) {
        estimateArray.add(
          FormGroup({
            'id': FormControl<String>(value: element.id),
            'item': FormControl<String>(value: element.item),
            'sell_unitPrice': FormControl<String>(value: element.sellUnitPrice),
            'sell_amountOfMoney':
                FormControl<String>(value: element.sellAmountOfMoney),
            'cost_unitPrice': FormControl<String>(value: element.costUnitPrice),
            'cost_amountOfMoney':
                FormControl<String>(value: element.costAmountOfMoney),
          }),
        );
      }
    }
  }

  ValueNotifier<AsyncData<EstimatemasterReportResponse>> submit =
      ValueNotifier(const AsyncData());

  Future<void> submitEstimatemasterReport(FormGroup formGroup) async {
    submit.value = const AsyncData(loading: true);
    await formGroup.control('arr').value.forEach((element) async {
      final response = await reportRepository
          .postEstimatemasterReport(EstimatemasterReportRequest(
        item: element['item'],
        sellUnitPrice: element['sell_unitPrice'],
        sellAmountOfMoney: element['sell_amountOfMoney'],
        costUnitPrice: element['cost_unitPrice'],
        costAmountOfMoney: element['cost_amountOfMoney'],
      ));
      submit.value = AsyncData(data: response);
      estimateMasterData.value =
          AsyncData(data: estimateMasterData.value.data!..add(response));
    });
  }
}
