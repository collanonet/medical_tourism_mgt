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
      logger.d('fetchEstimateMasterData');
      insertEstimateMaster(formGroup, response);
      estimateMasterData.value = AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      estimateMasterData.value = AsyncData(error: e);
    }
  }

  void insertEstimateMaster(
      FormGroup formGroup, List<EstimatemasterReportResponse>? data) {
    logger.d('insertEstimateMaster');
    try{
      if (data!.isNotEmpty) {
        var estimateArray = formGroup.control('arr') as FormArray;
        estimateArray.clear();
        for (var element in data) {
          logger.d(element.toJson());
          estimateArray.add(
            FormGroup({
              '_id': FormControl<String>(value: element.id),
              'project': FormControl<String>(value: element.project),
              'unitPriceSellingPrice':
              FormControl<String>(value: element.unitPriceSellingPrice),
              'amountOfMoneySellingPrice':
              FormControl<String>(value: element.amountOfMoneySellingPrice),
              'unitPriceCostPrice':
              FormControl<String>(value: element.unitPriceCostPrice),
              'amountOfMoneyCostPrice':
              FormControl<String>(value: element.amountOfMoneyCostPrice),
            }),
          );
        }
      }
    }catch(e){
      logger.e(e);
    }
  }

  ValueNotifier<AsyncData<EstimatemasterReportResponse>> submit =
      ValueNotifier(const AsyncData());

  Future<void> submitEstimatemasterReport(FormGroup formGroup) async {
    try{
      List<EstimatemasterReportResponse> data = [];
      await formGroup.control('arr').value.forEach((element) async {
        submit.value = const AsyncData(loading: true);
        final response = element['_id'] == null
            ? await reportRepository
            .postEstimatemasterReport(EstimatemasterReportRequest(
          project: element['project'].toString(),
          unitPriceSellingPrice:
          element['unitPriceSellingPrice'].toString(),
          amountOfMoneySellingPrice:
          element['amountOfMoneySellingPrice'].toString(),
          unitPriceCostPrice: element['unitPriceCostPrice'].toString(),
          amountOfMoneyCostPrice:
          element['amountOfMoneyCostPrice'].toString(),
        ))
            : await reportRepository.putEstimatemasterReport(
            element['_id'],
            EstimatemasterReportRequest(
              project: element['project'].toString(),
              unitPriceSellingPrice:
              element['unitPriceSellingPrice'].toString(),
              amountOfMoneySellingPrice:
              element['amountOfMoneySellingPrice'].toString(),
              unitPriceCostPrice: element['unitPriceCostPrice'].toString(),
              amountOfMoneyCostPrice:
              element['amountOfMoneyCostPrice'].toString(),
            ));
        data.add(response);
        submit.value = AsyncData(data: response);
      });

      estimateMasterData.value =
          AsyncData(data: estimateMasterData.value.data?..addAll(data));
    }catch(e){
      logger.e(e);
      submit.value = AsyncData(error: e);
    }
  }
}
