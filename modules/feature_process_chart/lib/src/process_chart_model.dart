import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_process_chart/data_process_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ProcessChartModel extends ChangeNotifier {
  ProcessChartModel({required this.processChartRepository});
  final ProcessChartRepository processChartRepository;

  ValueNotifier<AsyncData<List<DetailItineraryResponse>>> itinerraryData =
      ValueNotifier(const AsyncData());
  Future<void> fetchItinerary({FormGroup? form}) async {
    itinerraryData.value = const AsyncData(loading: true);
    notifyListeners();
    await processChartRepository
        .getPatientChart(
      tourName: form?.control('tourName').value == null
          ? null
          : form!.control('tourName').value,
      classification: form?.control('classification').value == null
          ? null
          : form!.control('classification').value,
      dateFrom: form?.control('dateFrom').value == null
          ? null
          : form!.control('dateFrom').value,
      dateTo: form?.control('dateTo').value == null
          ? null
          : form!.control('dateTo').value,
    )
        .then((value) {
      itinerraryData.value = AsyncData(data: value);
      notifyListeners();
    }).catchError((error) {
      logger.d('fald');
      itinerraryData.value = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
    logger.d('DataInProgress${itinerraryData.value.data!.length}');
  }

   ValueNotifier<List<Type>> classification = ValueNotifier([
    Type(type: '新規見積依頼'),
    Type(type: '新規手配依頼'),
    Type(type: '変更'),
    Type(type: 'キャンセル'),
    Type(type: 'Final'),
  ]);

}

class Type{
  final String type;
  Type({required this.type});
}